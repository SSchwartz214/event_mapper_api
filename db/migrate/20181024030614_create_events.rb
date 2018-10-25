class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :e_id
      t.string :url
      t.string :img
      t.string :date
      t.string :venue_name
      t.string :address
      t.string :lat
      t.string :lng
      t.string :distance

      t.timestamps
    end
  end
end
