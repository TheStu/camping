class CreateDotds < ActiveRecord::Migration
  def change
    create_table :dotds do |t|
      t.string :name
      t.string :retail_price
      t.string :sale_price
      t.string :thumb_image
      t.text :buy_url
      t.string :percent_off
      t.string :merchant_name

      t.timestamps null: false
    end
  end
end
