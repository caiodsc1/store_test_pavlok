class AddProductsCountToWishList < ActiveRecord::Migration[5.2]
  def change
    add_column :wish_lists, :products_count, :integer, default: 0, null: false
  end
end
