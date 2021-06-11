require 'rails_helper'

describe BookSuggestionsController, type: :controller do
  describe action 'POST #create' do
    subject(:post_suggestion) { post :create, params: { book_suggestion: book_suggestion } }
    describe example 'When creating a valid book suggestion' do
      default_example
      let!(:book_suggestion) { attributes_for(:book_suggestion) }

      it 'creates a new book suggestion' do
        expect { post_suggestion }.to change { BookSuggestion.count }.by(1)
      end

      it { is_expected.to have_http_status(:created) }
    end

    describe example 'When creating an invalid book suggestion' do
      let!(:book_suggestion) { attributes_for(:book_suggestion, author: nil) }
      before do
        post_suggestion
      end

      it 'doesn\'t create a new book suggestion' do
        expect { book_suggestion }.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it { is_expected.to have_http_status(:bad_request) }
    end
  end
end
