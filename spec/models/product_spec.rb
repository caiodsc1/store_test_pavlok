require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:new_product) { create(:product) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
  end

  describe 'methods' do
    it { is_expected.to respond_to(:main_category) }
    it { is_expected.to respond_to(:to_param) }
    it { expect(new_product.main_category).to eq new_product.category.main_category }
  end

  it 'little search test' do
    expect(Product.search(new_product.name)).to include(new_product)
  end
end
