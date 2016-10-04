class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :title
      t.string :url
      t.string :picture_url
      t.string :feature_one
      t.string :feature_two
      t.string :feature_three

      t.timestamps null: false
    end
  end
end
