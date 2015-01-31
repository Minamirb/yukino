class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, index: true
      t.string :content
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_foreign_key :questions, :users
  end
end
