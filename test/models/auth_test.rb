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
    OmniAuth::AuthHash.new({ :provider => "twitter",
                             :uid => "123456",
                             :info => {
                               :nickname => "johnqpublic",
                               :name => "John Q Public",
                               :location => "Anytown, USA",
                               :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                               :description => "a very normal guy.",
                               :urls => {
                                 :Website => nil,
                                 :Twitter => "https://twitter.com/johnqpublic"
                               }
                             },
                             :credentials => {
                               :token => "a1b2c3d4",
                               :secret => "abcdef1234"
                             }
                           })
  end
end
