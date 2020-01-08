class AddCounterCacheToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :products_count, :integer
  end
end
