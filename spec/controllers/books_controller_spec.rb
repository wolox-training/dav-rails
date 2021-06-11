require 'rails_helper'

describe BooksController, type: :controller do
  include_context 'Authenticated User'

  describe action 'GET #index' do
    describe example 'When fetching all books' do
      default_example
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with books json' do
        expected = Panko::ArraySerializer.new(books, each_serializer: BookSerializer).to_json
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

  describe action 'GET #show' do
    describe example 'When fetching a book using friendlyId' do
      default_example
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.slug }
      end

      it 'responses with the book json' do
        expect(JSON.parse(response.body).to_json).to eq BookSerializer.new.serialize(book).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
