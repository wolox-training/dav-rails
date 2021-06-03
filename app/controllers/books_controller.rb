class BooksController < ApplicationController
  def show
    render json: BooksService.new.find_book(params[:isbn])
  end
end
