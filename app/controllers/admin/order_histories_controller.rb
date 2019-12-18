class Admin::OrderHistoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@order_history = OrderHistory.all.order(id: "DESC")
  end

  def index2
  end

  def search
    @order_history2 = OrderHistory.where(customer_id: params[:customer_id]).order(id: "DESC")
    render :index2
  end

  def show
  	@order_history = OrderHistory.find(params[:id])
  	@order_detail = OrderDetail.all
    @order_history.shipping_fee = 800
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
	params.require(:order_history).permit(:payment_method, :order_status, :customer_id, :shipping_zipcode, :shipping_address, :name, :shipping_fee, :total_price)
  end
end
