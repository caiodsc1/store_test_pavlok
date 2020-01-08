class AddCounterCacheToMainCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :main_categories, :products_count, :integer
  end
end
