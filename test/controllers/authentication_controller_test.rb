require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase

  def setup
    User.create(email: "jwt@jwt.com", password: "jwtjwtjwt", password_confirmation: "jwtjwtjwt")
  end

  test 'POST /login suceeds for a valid email and password' do
    post :authenticate_user, params: { 'email':'jwt@jwt.com', 'password':'jwtjwtjwt' }
    assert_response :success
  end
end