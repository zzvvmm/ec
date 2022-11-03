class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :order_details, dependent: :destroy

  scope :asc_order, ->{order :price}

  def check_residual_quantity? quantity_params
    quantity_params.to_i.positive? && residual.to_i >= quantity_params.to_i
  end
end
