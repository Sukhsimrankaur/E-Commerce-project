class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :image  # For one image
  # OR use has_many_attached :images if you want multiple images
end
