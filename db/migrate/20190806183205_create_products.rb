class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column(:description, :string)
      t.column(:price, :decimal, precision: 6, scale: 2)
      t.column(:purchased, :boolean, :default => false)
    end
  end
end
