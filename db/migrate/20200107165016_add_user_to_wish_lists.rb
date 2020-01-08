class AddUserToWishLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :wish_lists, :user, foreign_key: true
  end
end
