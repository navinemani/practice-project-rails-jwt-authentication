class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  attr_reader :current_user

  protected

  def authenticate_request!
    if user_id_present?
      @current_user = User.find(auth_token[:user_id])
    else
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authorized'] }, status: :unauthorized
  end

  private

  def user_id_present?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  def http_token
    @http_token ||= request.headers['Authorization'].spllit(' ').last unless request.headers['Authorization'].split(' ').last
  end

  def auth_token
    @auth_token = JsonWebToken.decode(http_token)
  end
  
end
