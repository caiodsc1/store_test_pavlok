require 'rails_helper'

RSpec.describe MainCategory, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:categories) }
    it { is_expected.to have_many(:products).through(:categories) }
  end
end
