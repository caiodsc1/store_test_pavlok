class RemoveCategoryAndMainCategoryFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :category, :string
    remove_column :products, :maincategory, :string
  end
end
