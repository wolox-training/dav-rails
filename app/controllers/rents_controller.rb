class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated policy_scope(Rent), each_serializer: RentSerializer
  end

  def create
    rent = Rent.new(rent_params)
    authorize rent
    if rent.save
      render json: RentSerializer.new.serialize(rent).to_json, status: :created
    else
      render json: { error: rent.errors.messages }, status: :bad_request
    end
  end

  def book_rankings
    books = Book.all.order(times_rented: :desc)
    render_paginated books, each_serializer: BookRankingSerializer
  end

  def active
    rents = Rent.are_active(DateTime.current.to_date)
    render_paginated rents, each_serializer: RentSerializer
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
