class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, class_name: "Product"
end
