class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :phone
      t.string :card_number
      t.string :expiry
      t.string :cvv
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
