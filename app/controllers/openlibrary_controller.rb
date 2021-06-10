class OpenlibraryController < ApplicationController
  def show
    book = BooksService.new.find_book(params[:isbn])
    return render json: { message: 'Book not found' }, status: :not_found if book.blank?

    render json: book
  end
end
