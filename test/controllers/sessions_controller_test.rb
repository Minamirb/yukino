require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
  end

  test "on GET callback twitter" do
    get :create, provider: 'twitter'
    assert session[:auth_id]
    assert_redirected_to root_path
  end
end
