class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
