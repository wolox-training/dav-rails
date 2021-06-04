require 'rails_helper'

shared_context 'common' do |isbn|
  before do
    get :show, params: { isbn: isbn }
  end
end

describe BooksController, type: :controller do
  describe action 'GET #show' do
    describe example 'with valid isbn' do
      default_example
      include_context 'common', '0385472579'
      it 'has 200 status' do
        expect(response.status).to eq(200)
      end
    end

    describe example 'with invalid isbn' do
      include_context 'common', '038547257'
      it 'has 404 status' do
        expect(response.status).to eq(404)
      end
    end
  end
end
