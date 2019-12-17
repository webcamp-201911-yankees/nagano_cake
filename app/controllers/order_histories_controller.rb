class OrderHistoriesController < ApplicationController
  def index
	@order_index = OrderHistory.all
# 	@order_show = OrderHistory.find(params[:id])
# end
  end

  def create
    @order_history = OrderHistory.new(order_params)
    @order_history.save
    @carts = current_customer.carts
    @carts.destroy_all
    redirect_to carts_complete_path

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
	params.require(:order_history).permit(:payment_method,:customer_id,:zipcode,:address,:name)
  end
  def order_detail_params
    params.requiure(:order_detail).permit(:order_history_id,:product_id,:tax_included,:number,:prepare_status)
  end
end