class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :provider
      t.string :uid
      t.string :credentials_token
      t.string :credentials_secret
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :auths, :users
  end
end
