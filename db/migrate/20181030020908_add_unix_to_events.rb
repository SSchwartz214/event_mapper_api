class AddUnixToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :unix, :string
  end
end
