class BooksService
  include HTTParty
  base_uri Rails.application.credentials.base_uri
  BOOKS_PATH = '/books'.freeze

  def find_book(isbn)
    options = { query: { bibkeys: isbn, format: 'json', jscmd: 'data' } }
    book = self.class.get(BOOKS_PATH, options)
    process_response(book, isbn)
  end

  def process_response(book, isbn)
    keys = %i[title subtitle number_of_pages authors]
    JSON.parse(book.body)[isbn].deep_symbolize_keys.slice(*keys)
  end
end
