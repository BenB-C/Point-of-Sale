class AddDateToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column(:purchases, :date, :datetime)
  end
end
