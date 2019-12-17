class Admin::OrderHistoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@order_history = OrderHistory.all
  end

  def show
  	@order_history = OrderHistory.find(params[:id])
  	@order_detail = OrderDetail.all
  end

  def edit
    @order_history = OrderHistory.find(params[:id])
  end

  def update
    order_history = OrderHistory.find(params[:id])
    order_history.update(order_params)
    redirect_to admin_order_history_path(order_history.id)
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_params)
    redirect_to admin_order_history_path(order_history.id)
  end

  private
  def order_params
	params.require(:order_history).permit(:payment_method, :order_status, :customer_id, :shipping_zipcode, :shipping_address, :name, :shipping_fee)
  end
end
