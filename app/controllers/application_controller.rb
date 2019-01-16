class ApplicationController < ActionController::Base
  attr_reader :current_user

  protected

  def authenticate_request
    if user_id_present?
      @current_user = User.find(auth_token[:user_id])
    else
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authorized'] }, status: :unauthorized
  end
end
