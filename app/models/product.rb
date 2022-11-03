class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
