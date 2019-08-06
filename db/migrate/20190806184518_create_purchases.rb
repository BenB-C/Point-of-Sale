class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|      
      t.timestamp
    end
  end
end
