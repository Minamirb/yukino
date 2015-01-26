class Auth < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_form_auth_hash(hash)
    auth = Auth.find_or_initialize_by(provider: hash.provider, uid: hash.uid)
    auth.attributes = {
      credentials_token:  hash.credentials.token,
      credentials_secret: hash.credentials.secret
    }

    unless auth.user_id
      auth.user = User.create
    end

    auth.save!
    auth
  end
end
