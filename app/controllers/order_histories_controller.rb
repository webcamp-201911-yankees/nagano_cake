class OrderHistoriesController < ApplicationController
  def index
    @customer = current_customer
    @orders = OrderHistory.all.order(id: "desc")
  end

  def create
    @order_history = OrderHistory.new(order_params)
    @order_history.order_status = "入金待ち"
    @order_history.save
    @carts = current_customer.carts
    @carts.destroy_all
    redirect_to carts_complete_path

  end

  def show
    @order_history = OrderHistory.find(params[:id])
    @order_details = OrderDetail.where(order_history_id: params[:id])
  end

  def edit
  end

  def update
  end

  def complete
  end

  private
  def order_params
	params.require(:order_history).permit(:payment_method,:customer_id,:zipcode,:address,:name, :order_status)
  end
  def order_detail_params
    params.requiure(:order_detail).permit(:order_history_id,:product_id,:tax_included,:number,:prepare_status)
  end
end