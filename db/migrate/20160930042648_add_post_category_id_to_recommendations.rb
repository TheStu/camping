class AddPostCategoryIdToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :post_category_id, :integer
  end
end
