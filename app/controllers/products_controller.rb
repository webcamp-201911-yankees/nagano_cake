class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  end

  def edit
  end
  

  def show
  end

  private
  def product_params
  	params.require(:product).permit(:product_image,:caption,:product_name,:category_id,:tax_excluded,:sale_status)
  end
end
