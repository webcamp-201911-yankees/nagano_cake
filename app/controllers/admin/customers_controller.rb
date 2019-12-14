class Admin::CustomersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@customers = Customer.with_deleted
	end

	def show
	  	@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
	  	@customer = Customer.with_deleted.find(params[:id])
	end

	def update
	  	customer = Customer.with_deleted.find(params[:id])
	  	customer.update(customer_params)
	  	redirect_to admin_customer_path(customer.id)
	end

	def toggle_status
		@customer = Customer.with_deleted.find(params[:customer_id])
		@customer.update(account_status: @customer.toggle_status)
		if @customer.account_status == "有効"
			@customer.restore
		else
			@customer.destroy
		end
		redirect_to edit_admin_customer_path(@customer.id)
	end

	private
	def customer_params
	  	params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email, :encrypted_password, :account_status)
	end
end
