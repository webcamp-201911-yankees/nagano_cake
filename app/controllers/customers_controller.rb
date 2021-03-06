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

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    customer.account_status = '無効' #admin側で無効状態の表示をするためステータス変更
    customer.save
    redirect_to new_customer_session_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :account_status)
  end
end
