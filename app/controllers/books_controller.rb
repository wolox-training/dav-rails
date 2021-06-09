class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    books = Rack::Reducer.call(params, dataset: Book.all, filters: [
      ->(author:) { where('lower(author) like ?', "%#{author.downcase}%") },
      ->(genre:) {  where('lower(genre) like ?', "%#{genre.downcase}%") },
      ->(title:) {  where('lower(title) like ?', "%#{title.downcase}%") }
      ])
    
      render_paginated books, each_serializer: BookSerializer
  end

  def show
    book = Book.find(params[:id])
    render json: BookSerializer.new.serialize(book).to_json
  end
end
