class OpenLibraryServiceMock
  include WebMock::API
  def request_success
    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(query: { bibkeys: '0385472579', format: 'json', jscmd: 'data' })
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/openlibrary_service_response_success.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end

  def request_empty_response
    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(query: { bibkeys: '038547257', format: 'json', jscmd: 'data' })
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/openlibrary_service_response_empty.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end
end
