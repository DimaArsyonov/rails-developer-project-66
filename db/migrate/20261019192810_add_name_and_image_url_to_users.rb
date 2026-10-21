class AddNameAndImageUrlToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image_url, :string
  end
end
