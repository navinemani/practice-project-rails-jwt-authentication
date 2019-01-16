class AuthenticationController < ApplicationController

  def authenticate_user
    user = User.find_for(email: params[:email])

    if user && user.authenticate(params[:password])
      render json:
    else
      render json: { errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless usesr.id
    {
      auth_token: JsonWebToken.encode({ user_id: user.id })
    }
  end
end
