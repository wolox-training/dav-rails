class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit

  def index
    render json: { message: 'Welcome to Rails Wbooks-API' }
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { message: 'User not authorized to perform this action' }, status: :unauthorized
  end
end
