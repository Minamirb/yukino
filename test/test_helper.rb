ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :provider => "twitter",
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


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
