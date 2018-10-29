class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :imageUrl, :string
  end
end
