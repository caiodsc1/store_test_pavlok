class RemoveTotalItemsAndTotalPriceFromWishList < ActiveRecord::Migration[5.2]
  def change
    remove_column :wish_lists, :total_items, :integer
    remove_column :wish_lists, :total_price, :float
  end
end
