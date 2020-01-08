class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.string :name
      t.integer :total_items, null: false, default: 0
      t.float :total_price, null: false, default: 0

      t.timestamps
    end
  end
end
