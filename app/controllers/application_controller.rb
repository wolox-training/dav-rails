class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  include DeviseTokenAuth::Concerns::SetUserByToken
  def index
    render json: { message: 'Welcome to Rails Wbooks-API' }
  end
end
