class RenameCategoryToCategoryId < ActiveRecord::Migration
  def change
  	rename_column :posts, :category, :post_category_id
  end
end
