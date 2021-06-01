class BooksController < ApplicationController
  def book_information
    render json: BooksService.new.find_book(params[:isbn])
  end
end
