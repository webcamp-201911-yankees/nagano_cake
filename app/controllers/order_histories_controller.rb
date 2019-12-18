class OrderHistoriesController < ApplicationController
  def index
    @orders = current_customer.order_histories.all.order(id: "desc")
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
    @Order_history = "発送待ち"
    @order_history.shipping_fee = 800
  end

  def edit
    @order_history = OrderHistory.find(params[:id])
  end

  def update
    order_history = OrderHistory.find(params[:id])
    order_history.update(order_params)
    redirect_to admin_order_history_path(order_history.id)
  end

  def complete
  end

  private
    def order_params
      params.require(:order_history).permit(:payment_method,:customer_id,:zipcode,:address,:name,:order_status,:total_price,:shipping_fee, order_details_attributes:[:order_history_id,:product_id,:tax_included,:number,:prepare_status])
    end
end
