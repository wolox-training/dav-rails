class BooksService
  include HTTParty
  base_uri 'openlibrary.org'

  def find_book(isbn)
    options = { query: { bibkeys: isbn, format: 'json', jscmd: 'data' } }
    book = self.class.get('/api/books', options)

    keys = %w[title subtitle number_of_pages authors]
    JSON.parse(book.body)[isbn].keep_if { |k, _| keys.include?(k) }
  end
end
