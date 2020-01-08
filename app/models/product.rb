class Product < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_products, against: [:name], using: {
    tsearch: { prefix: true },
    trigram: {}
  }

  scope :search, ->(term) { term.present? ? search_products(term) : all }

  belongs_to :category, counter_cache: true
  delegate :main_category, to: :category
  validates_presence_of :name, :price
  validates_numericality_of :price

  after_create { main_category.increment!(:products_count) }
  after_destroy { main_category.decrement!(:products_count) }
end
