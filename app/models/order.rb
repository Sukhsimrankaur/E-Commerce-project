class Order < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy  # 👈 Add this line
  has_many :order_items, dependent: :destroy
end
