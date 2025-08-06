class AddPriceAtOrderToOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items, :price_at_order, :decimal
  end
end
