class AddTitleParamToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title_param, :string
  end
end
