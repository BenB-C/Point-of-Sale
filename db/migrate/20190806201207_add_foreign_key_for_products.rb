class AddForeignKeyForProducts < ActiveRecord::Migration[5.2]
  def change
    add_column(:products, :purchase_id, :integer)
    add_foreign_key :products, :purchases
  end
end
