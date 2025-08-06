class AddNameAndPhoneNumberToAddresses < ActiveRecord::Migration[8.0]
  def change
    # add_column :addresses, :name, :string
    add_column :addresses, :phone_number, :string
  end
end
