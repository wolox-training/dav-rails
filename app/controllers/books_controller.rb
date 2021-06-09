class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    books = Book::Reducer.apply(params)
    render_paginated books, each_serializer: BookSerializer
  end

  def show
    book = Book.friendly.find(params[:id])
    render json: BookSerializer.new.serialize(book).to_json
  end
end
