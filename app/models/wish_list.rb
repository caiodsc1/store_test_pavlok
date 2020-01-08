class WishList < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :user

  has_many :wish_list_products, dependent: :delete_all
  has_many :products, -> { order(:name) }, through: :wish_list_products

  accepts_nested_attributes_for :products
  accepts_nested_attributes_for :wish_list_products

  def products_total
    products.sum(:price)
  end

  def products_price
    number_to_currency products_total
  end
end
