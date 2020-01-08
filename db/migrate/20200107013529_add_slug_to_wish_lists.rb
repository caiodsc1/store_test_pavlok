class AddSlugToWishLists < ActiveRecord::Migration[5.2]
  def change
    add_column :wish_lists, :slug, :string
    add_index :wish_lists, :slug, unique: true
  end
end
