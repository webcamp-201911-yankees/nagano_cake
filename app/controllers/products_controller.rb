class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end

  def edit
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to admin_product_path(product.id)
    else
      redirect_to admin_products_path
    end
  end



  private
  def product_params
  	params.require(:product).permit(:product_image, :caption,:product_name,:category_id,:tax_excluded,:sale_status)
  end
end
