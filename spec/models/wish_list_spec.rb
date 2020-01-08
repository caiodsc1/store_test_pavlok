require 'rails_helper'

RSpec.describe WishList, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:wish_list_products) }
    it { is_expected.to have_many(:products) }

    it { is_expected.to accept_nested_attributes_for(:wish_list_products) }
    it { is_expected.to accept_nested_attributes_for(:products) }
  end

  describe 'methods' do
    it { is_expected.to respond_to(:products_total) }
    it { is_expected.to respond_to(:products_price) }
  end
end
