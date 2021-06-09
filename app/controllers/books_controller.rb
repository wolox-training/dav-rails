class BooksController < ApplicationController
  include Wor::Paginate

  def index
    render_paginated Book.all
  end

  def show
    book = Book.find(params[:id])

    render(
      json: Panko::Response.create do |r|
        {
          success: true,
          book: r.serializer(book, BookSerializer)
        }
      end
    )
  end

  def book_information
    book = BooksService.new.find_book(params[:isbn])
    return render json: { message: 'Book not found' }, status: :not_found if book.blank?

    render json: book
  end
end
