class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.integer :user_id
      t.string :access_token
      t.timestamps
    end
  end
end
