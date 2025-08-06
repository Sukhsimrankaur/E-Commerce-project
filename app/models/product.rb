class Product < ApplicationRecord
   belongs_to :category, optional: true

  has_one_attached :image  # For one image
  has_many :order_items

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :sku, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
