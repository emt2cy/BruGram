class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.boolean :public
      t.text :caption
      t.string :image
      t.references :user

      t.timestamps null: false
    end
  end
end
