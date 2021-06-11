class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render_paginated current_user.rents, each_serializer: RentSerializer
  end

  def create
    rent = Rent.create(rent_params)
    if rent.valid?
      render json: RentSerializer.new.serialize(rent).to_json, status: :created
    else
      render json: { error: rent.errors.messages }, status: :bad_request
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
