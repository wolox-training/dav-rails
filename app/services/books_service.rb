class BooksService
  include HTTParty
  base_uri Rails.application.credentials.base_uri

  def find_book(id)
    options = { query: { bibkeys: id, format: 'json', jscmd: 'data' } }
    book = self.class.get('/api/books', options)

    keys = %w[title subtitle number_of_pages authors]
    JSON.parse(book.body)[id].keep_if { |k, _| keys.include?(k) }
  end
end
