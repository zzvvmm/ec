class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validate :name, presence: true
end
