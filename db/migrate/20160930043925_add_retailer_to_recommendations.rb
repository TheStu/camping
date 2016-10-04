class AddRetailerToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :retailer, :string
  end
end
