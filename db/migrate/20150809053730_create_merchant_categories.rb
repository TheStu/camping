class CreateMerchantCategories < ActiveRecord::Migration
  def change
    create_table :merchant_categories do |t|
      t.integer :category_id
      t.integer :merchant_id
      t.integer :matching_product_group_id

      t.timestamps null: false
    end
  end
end
