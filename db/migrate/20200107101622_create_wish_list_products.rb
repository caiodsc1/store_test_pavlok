class CreateWishListProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_list_products do |t|
      t.references :wish_list, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
