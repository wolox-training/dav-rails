require 'rails_helper'

describe BooksService, type: :service do
  mocks = OpenLibraryServiceMock.new
  service = described_class.new
  describe 'GET open_library#show' do
    context 'with a valid ISBN' do
      before do
        mocks.request_success
        service.find_book('0385472579')
      end

      it 'makes an external request' do
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books')
          .with(query: { bibkeys: '0385472579', format: 'json', jscmd: 'data' })
      end
      it 'returns a hash with the correct title' do
        expect(service.find_book('0385472579')[:title]).to eq('Zen speaks')
      end
    end

    context 'with an invalid ISBN' do
      before do
        mocks.request_empty_response
        service.find_book('038547257')
      end
      it 'makes an external request' do
        expect(WebMock).to have_requested(:get, 'https://openlibrary.org/api/books')
          .with(query: { bibkeys: '038547257', format: 'json', jscmd: 'data' })
      end
      it 'returns an empty hash' do
        expect(service.find_book('038547257')[:response]).to be_nil
      end
    end
  end
end
