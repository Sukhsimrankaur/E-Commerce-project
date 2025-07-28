class UpdateForeignKeyOnProductsToNullify < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :products, :categories

    add_foreign_key :products, :categories, on_delete: :nullify
  end
end
