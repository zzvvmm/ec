class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :rate_product, ->(product_id){where product_id: product_id}

  validates :star, presence: true,
  length: {maximum: Settings.rating_max,
           minimum: Settings.rating_min}

  validates :content, presence: true,
  length: {maximum: Settings.content_max}
end
