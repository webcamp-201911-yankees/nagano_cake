class CartsController < ApplicationController

	def index
		@carts =  current_customer.carts
	end

    def new
	  @order_input = OrderHistory.new
	  @new_address = ShippingAddress.new
    end


	def create
		if current_customer.carts.where(product_id: params[:cart][:product_id].to_i).empty?
		@cart = Cart.new(cart_params)
		@cart.customer_id = current_customer.id
  	    @cart.save
	   else
		@cart = current_customer.carts.find_by(product_id:params[:cart][:product_id].to_i)
		@cart.update(number: params[:cart][:number].to_i + @cart.number)
        end
        redirect_to products_path
	end


    def confirm
      @carts = current_customer.carts
      @order_histories = current_customer.order_histories

      if params[:selected_button] == "customer_address"
      	@customer_address = current_customer.address
      	@customer_address.save
      	## current_customer
      	#
      end

      if  params[:selected_button] == "another_address"
      	@shipping_address =  Shipping_address.where(customer_id: params[:shipping_address])
      end

	  if  params[:selected_button] == "new_customer_address"
	  	@new_address = ShippingAddress.find(current_customer.id)
	  	@new_address.save
      end
    end

    def complete
    end

	def show
		pp params[:id]
		# @product = Product.find(current_customer.id)
		# @order_history = OrderHistory.find(current_customer.id)
		# @order_detail = OrderDetail.find(@order_history.id)
		# @cart = Cart.find(current_customer.customer_id)
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

	def destroy_all
		@carts =  current_customer.carts
		@carts.destroy_all
		redirect_to products_path
	end

 private
 	def product_params
  	params.require(:product).permit(:product_image, :caption,:product_name,:category_id,:tax_excluded,:sale_status)
    end

    def cart_params
    params.require(:cart).permit(:number,:product_id)
    end
 end