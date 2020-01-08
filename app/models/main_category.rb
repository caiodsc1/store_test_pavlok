class MainCategory < ApplicationRecord
  has_many :categories, -> { order(:name) }
  has_many :products, through: :categories
  validates_presence_of :name
end
