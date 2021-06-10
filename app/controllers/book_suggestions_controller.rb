class BookSuggestionsController < ApplicationController
  def create
    book_suggestion = BookSuggestion.create(book_suggestion_params)
    if book_suggestion.save
      render json: book_suggestion, status: :created
    else
      render json: { Error: 'The book suggestion could not be created.' }, status: :bad_request
    end
  end

  private

  def book_suggestion_params
    params.require(:book_suggestion)
          .permit(:synopsis, :price, :author, :title, :link, :editor, :year, :user_id)
  end
end
