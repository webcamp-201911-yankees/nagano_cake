class CartsController < ApplicationController

	def index
		@carts =  current_customer.carts
	end

	def show
		@product = Product.find(current_customer.id)
		@order_detail = OrderDetail.find(@product.product_id)
		@cart = Cart.find(@order_detail)
		@order_history = OrderHistory.find(current_customer.id)

	end
	def create
		@cart = Cart.new(cart_params)
		@cart.customer_id = current_customer.id
  	    @cart.save
  	    redirect_to products_path
	end


	def update
		@cart = Cart.find(params[:id])
		@cart.update(cart_params)
		redirect_to carts_path
	end

	def destroy
		@cart = Cart.find(params[:id])
        @cart.destroy
        redirect_to carts_path
	end

 private

 	def product_params
  	params.require(:product).permit(:product_image, :caption,:product_name,:category_id,:tax_excluded,:sale_status)
    end

    def cart_params
    params.require(:cart).permit(:number,:product_id)
    end

 end