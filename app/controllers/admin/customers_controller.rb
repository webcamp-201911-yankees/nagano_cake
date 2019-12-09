class Admin::CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show

	end

	private
	def customer_params
	  	params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email, :password, :account_status)
	end
end