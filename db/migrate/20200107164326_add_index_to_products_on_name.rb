class AddIndexToProductsOnName < ActiveRecord::Migration[5.2]
  def change
    add_index(:products, :name, using: 'gin', opclass: :gin_trgm_ops) unless index_exists?(:products, :name)
  end
end
