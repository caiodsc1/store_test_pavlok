require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:main_category) }
    it { is_expected.to have_many(:products) }
  end

  describe 'methods' do
    it { is_expected.to respond_to(:main_category_name) }
    it { is_expected.to respond_to(:to_param) }
  end
end
