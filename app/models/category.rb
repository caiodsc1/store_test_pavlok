class Category < ApplicationRecord
  validates_presence_of :name
  belongs_to :main_category
  has_many :products
  delegate :name, to: :main_category, prefix: true

  def to_param
    "#{id} #{main_category_name} #{name}".parameterize
  end
end
