class BooksService
  include HTTParty
  base_uri Rails.application.credentials.base_uri

  def find_book(id)
    path = '/api/books'
    options = { query: { bibkeys: id, format: 'json', jscmd: 'data' } }
    book = self.class.get(path, options)

    keys = %i[title subtitle number_of_pages authors]
    JSON.parse(book.body)[id].deep_symbolize_keys.slice(*keys)
  end
end
