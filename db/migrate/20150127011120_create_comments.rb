class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description, null: false
      t.integer :image_id, null: false

      t.timestamps
    end
  end
end
