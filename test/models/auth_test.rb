require 'test_helper'

class AuthTest < ActiveSupport::TestCase
  test "#find_or_create_form_auth_hash" do
    assert_difference("Auth.count") do
      auth = Auth.find_or_create_form_auth_hash(auth_hash)
      assert_equal auth_hash.uid, auth.uid
      assert auth.user
    end
  end

  private
  def auth_hash
    OmniAuth::AuthHash.new(OmniAuth.config.mock_auth[:twitter])
  end
end
