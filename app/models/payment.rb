class Payment < ApplicationRecord
  belongs_to :user

  validates_presence_of :total, :success
end
