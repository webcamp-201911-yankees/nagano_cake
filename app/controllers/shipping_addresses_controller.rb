class ShippingAddressesController < ApplicationController
	def index
		@shipping_addresses = ShippingAddress.find(current_customer.id)
		@shipping_addressn = ShippingAddress.new
	end

	def show
	end

	def new
	end

	def create
		@shipping_addressn = ShippingAddress.new(shipping_address_params)
  	    @shipping_addressn.save
  	    redirect_to shipping_addresses_path
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def update
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_address.update(shipping_address_params)
		redirect_to shipping_addresses_path
	end

	def destroy
		@shipping_address = ShippingAddress.find(params[:id])
        @shipping_address.destroy
        redirect_to shipping_addresses_path
	end

 private
  	def shipping_address_params
    	params.require(:shipping_address).permit(:shipping_zipcode,:shipping_address,:name)
  	end

end
