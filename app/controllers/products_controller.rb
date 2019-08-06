class ProductsController < ApplicationController
  @update_product = false
  def index
    # binding.pry
    @products = Product.all.select { |product| (!product.purchase_id) && (!product.in_cart) }
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:notice] = "Product could not be added :("
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @update_product
      @update_product = false
      if @product.update(product_params)
        redirect_to products_path
      else
        render :edit
      end
    else
      @product.update({:in_cart => !@product.in_cart})
      if @product.in_cart
        redirect_to new_purchase_path
      else
        redirect_to products_path
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
    @update_product = true
    render :edit
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

end
