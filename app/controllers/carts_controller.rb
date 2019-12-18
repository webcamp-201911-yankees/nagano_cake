class CartsController < ApplicationController

	def index
		@carts =  current_customer.carts
	end

    def new
	  @order_history = OrderHistory.new
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
      @order_history = OrderHistory.new
      @order_history.payment_method = params[:order_history][:payment_method]
      @new_address = ShippingAddress.new

      if params[:selected_button] == "customer_address"
        @order_history.zipcode = current_customer.zipcode      	
      	@order_history.address = current_customer.address
      	@order_history.name = current_customer.last_name + current_customer.first_name

      end
      if  params[:selected_button] == "another_address"
      	@shipping_address =  ShippingAddress.find(params[:order_history][:customer_id])
      	@order_history.address = @shipping_address.full_address
      end
	  if  params[:selected_button] == "new_customer_address"
	  	@order_history.zipcode = params[:order_history][:shipping_address][:shipping_zipcode]
      	@order_history.address = params[:order_history][:shipping_address][:shipping_address]
      	@order_history.name = params[:order_history][:shipping_address][:name]
      end

      @order_details = OrderDetail.new
    end

    def complete

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
    def order_params
	  params.require(:order_history).permit(:payment_method,:customer_id,:zipcode,:address,:name)
    end
    def order_details_params
      params.require(:order_detail).permit(:order_history_id,:product_id,:tax_included,:number,:prepare_status)
    end
 end