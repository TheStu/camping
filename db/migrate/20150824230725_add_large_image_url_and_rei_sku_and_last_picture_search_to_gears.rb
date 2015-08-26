class AddLargeImageUrlAndReiSkuAndLastPictureSearchToGears < ActiveRecord::Migration
  def change
    add_column :gears, :large_image_url, :string
    add_column :gears, :last_picture_search, :datetime
  end
end
