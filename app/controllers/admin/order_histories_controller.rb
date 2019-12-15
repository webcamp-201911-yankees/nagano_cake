class Admin::OrderHistoriesController < ApplicationController
  def index
  	@order_histories = Order_historie.all
  end

  def show
  end
end
