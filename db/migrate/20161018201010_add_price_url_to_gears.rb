class AddPriceUrlToGears < ActiveRecord::Migration
  def change
  	add_column :gears, :price_url, :string
  end
end
