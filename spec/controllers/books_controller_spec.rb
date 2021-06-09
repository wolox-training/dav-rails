require 'rails_helper'

shared_context 'common' do |isbn|
  before do
    get :show, params: { isbn: isbn }
  end
end

describe OpenlibraryController, type: :controller do
  describe action 'GET #show' do
    book_info = JSON.parse(
      File.read('./spec/support/fixtures/openlibrary_service_response_success.json'),
      symbolize_names: true
    )
    empty_result = JSON.parse(
      File.read('./spec/support/fixtures/openlibrary_service_response_empty.json'),
      symbolize_names: true
    )
    before do
      stubbed_service = instance_double(BooksService)
      allow(stubbed_service).to receive(:find_book).with('0385472579').and_return(book_info)
      allow(stubbed_service).to receive(:find_book).with('038547257').and_return(empty_result)
      allow(BooksService).to receive(:new).and_return(stubbed_service)
    end

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
