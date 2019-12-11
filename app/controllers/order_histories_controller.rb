class OrderHistoriesController < ApplicationController
  2def index
	@order_index = OrderHistory.all
# 	@order_show = OrderHistory.find(params[:id])
# end
  end
  def new
	@order_input = OrderHistory.new
	@new_address = ShippingAddress.new
  end

  def create
	@order_input = OrderHistory.new(order_params)
	@new_address = OrderHistories.new(order_params)

	# if params[:order_histories][:address] ==　"ご自身の住所"
	# 	@order_input.zipcode  ==  current_customer.zipcode
	# 	@order_input.address  ==  current_customer.address
	# 	@order_input.name  ==  current_customer.name

	# elsif params[:address] == "新しいお届け先"

	# # else params[:address] == "登録済住所から選択
  end

  def show
  end

  def edit
  end

  def update
  end

  def complete
  end

  private
  def order_params
	params.require(:order_histories).permit(:payment_method,:customer_id,:shipping_zipcode,:shipping_address,:name)
  end

end