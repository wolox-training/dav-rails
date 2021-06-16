require 'rails_helper'

describe RentsController, type: :controller do
  include_context 'Authenticated User'

  describe action 'GET #index' do
    describe example 'When fetching all rents' do
      default_example
      let!(:rents) { create_list(:rent, 3) }

      before do
        get :index
      end

      it 'responses with rents json' do
        expected = Panko::ArraySerializer.new(rents, each_serializer: RentSerializer).to_json
        expect(response.body) =~ JSON.parse(expected)
      end

      it 'is paginated' do
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe action 'POST #create' do
    subject(:post_rent) { post :create, params: { rent: rent } }
    describe example 'When creating a valid rent' do
      default_example
      let!(:rent) { attributes_for(:rent, user_id: user.id) }
      it 'creates a new rent' do
        expect { post_rent }.to change { Rent.count }.by(1)
      end

      it { is_expected.to have_http_status(:created) }
    end

    describe example 'When creating an invalid rent' do
      let!(:rent) { attributes_for(:rent, user_id: user.id, start_date: nil) }
      before do
        post_rent
      end

      it 'doesn\'t create a new rent' do
        expect { post_rent }.to change { Rent.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it { is_expected.to have_http_status(:bad_request) }
    end
  end

  describe action 'GET #book_rankings' do
    describe example 'When fetching all books ordered by times rented' do
      default_example
      let!(:books) { create_list(:book, 3) }

      before do
        get :book_rankings
      end

      it 'responses with books ranking json' do
        expected = Panko::ArraySerializer.new(books,
                                              each_serializer: BookRankingSerializer).to_json
        expect(response.body) =~ JSON.parse(expected)
      end

      it 'is paginated' do
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe action 'Get #active' do
    describe example 'When fetching all active rents' do
      default_example
      let!(:rents) { create_list(:rent, 3) }

      before do
        get :active
      end

      it 'responses with rents json' do
        expected = Panko::ArraySerializer.new(rents, each_serializer: RentSerializer).to_json
        expect(response.body) =~ JSON.parse(expected)
      end

      it 'is paginated' do
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
