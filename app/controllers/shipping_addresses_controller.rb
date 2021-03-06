class ShippingAddressesController < ApplicationController
	  before_action :authenticate_customer!
	def index
		@customer = current_customer #ログイン中の会員の配送先情報のみ取得するために設定
		@shipping_addresses = ShippingAddress.all
		@shipping_addressn = ShippingAddress.new
	end

	def show
	end

	def new
	end

	def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.customer_id = current_customer.id #配送先に会員idを登録
  	    @shipping_address.save
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
