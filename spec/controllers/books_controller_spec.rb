require 'rails_helper'

describe BooksController, type: :controller do
  describe action 'GET #show' do
    describe example 'with valid isbn' do
      default_example
      before do
        get :show, params: { isbn: '0385472579' }
      end
      it 'has 200 status' do
        expect(response.status).to eq(200)
      end
    end

    describe example 'with invalid isbn' do
      before do
        get :show, params: { isbn: '038547257' }
      end
      it 'has 404 status' do
        expect(response.status).to eq(404)
      end
    end
  end
end
