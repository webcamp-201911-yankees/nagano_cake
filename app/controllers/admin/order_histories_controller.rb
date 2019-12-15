class Admin::OrderHistoriesController < ApplicationController
  def index
  	@order_histories = OrderHistory.all
  end

  def show
  end
end
