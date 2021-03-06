class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def top
     @order_histories = OrderHistory.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  	redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to admin_product_path(product.id)
    else
      redirect_to admin_products_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
  	params.require(:product).permit(:product_image, :caption,:product_name,:category_id,:tax_excluded,:sale_status)
  end
end
