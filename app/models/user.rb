class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wish_list

  before_create { build_wish_list }

  def clear_cart
    wish_list.products.delete_all
    wish_list.decrement!(:products_count, wish_list.products_count) # Ou WishList.reset_counters(id, field)
  end
end
