class ApplicationController < ActionController::Base
  def index
    render json: { message: 'Welcome to Rails Wbooks-API' }
  end
end
