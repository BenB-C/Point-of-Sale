class Purchase < ApplicationRecord
  has_many :products

  def self.between(start_date, end_date)
    Purchase.where(:date => start_date..end_date)
  end

  def self.total
    Product.where.not(purchase_id: nil).sum(:price)
  end
end
