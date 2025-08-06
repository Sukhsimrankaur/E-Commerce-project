class AddPaymentDetailsToAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :phone, :string
    add_column :addresses, :card_number, :string
    add_column :addresses, :expiry, :string
    add_column :addresses, :cvv, :string
  end
end
