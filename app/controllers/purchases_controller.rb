class PurchasesController < ApplicationController
  def index
    # binding.pry
    @purchases = Purchase.all
    @total = Purchase.total
    render :index
  end

  def new
    @total = Product.where(in_cart: true).sum(:price)
    @purchase = Purchase.new
    @products = Product.all.select { |product| (!product.purchase_id) && (product.in_cart) }
    render :new
  end

  def edit
    render :edit
  end

  def create
    @purchase = Purchase.new({:date => DateTime.now})
    @purchase.save
    @products = Product.all.select { |product| (!product.purchase_id) && (product.in_cart) }
    @products.each do |product|
      product.update({:purchase_id => @purchase.id, :in_cart => false})
    end
    # TODO redirect to purchases index
    redirect_to products_path
  end

end
