class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def index2
  end

  def search
    @products2 = Product.where(category_id: params[:category_id])
    @categories = Category.all
    render :index2
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
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
      render "admin/products/edit.html.erb"
    end
  end



  private
  def product_params
  	params.require(:product).permit(:product_image, :caption,:product_name,:category_id,:tax_excluded,:sale_status)
  end
end
