class WishListProduct < ApplicationRecord
  belongs_to :wish_list, counter_cache: :products_count
  belongs_to :product
  validates_uniqueness_of :product, scope: :wish_list, message: 'Este produto já está adicionado na sua lista de compras!'
end
