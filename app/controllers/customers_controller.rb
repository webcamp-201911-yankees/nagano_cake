class CustomersController < ApplicationController
  def index
  	@customers = Customer.all
  end

  def show
  	@customer = current_customer
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to customer_path(@customer.id)
  end

  private
  def customer_params
  	params.require(:customer).permit(:email,:encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :account_status)
  end
end
