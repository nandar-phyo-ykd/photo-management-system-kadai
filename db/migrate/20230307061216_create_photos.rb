class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos, primary_key: :id, auto_increment: true do |t|
      t.string :title, null: false
      t.string :attachment, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
