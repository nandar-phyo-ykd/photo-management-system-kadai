class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
