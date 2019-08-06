class RenamePurchasedToInCartForProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :purchased, :in_cart
  end
end
