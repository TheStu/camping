class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :posts, :recommendations do |t|
      t.index [:post_id, :recommendation_id]
      t.index [:recommendation_id, :post_id]
    end
  end
end
