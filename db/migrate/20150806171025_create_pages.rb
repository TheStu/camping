class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :content
      t.string :title
      t.integer :thumbs_up
      t.integer :thumbs_down
      t.string :large_image_url
      t.string :thumb_image_url
      t.string :meta_title
      t.string :meta_desc

      t.timestamps null: false
    end
  end
end
