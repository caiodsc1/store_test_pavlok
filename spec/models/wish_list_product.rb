require 'rails_helper'

RSpec.describe WishListProduct, type: :model do
  let!(:new_product) { create(:product) }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:products).scope(:wish_list) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:wish_list) }
    it { is_expected.to belong_to(:product) }
  end
end
