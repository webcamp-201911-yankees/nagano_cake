class Admin::OrderDetailsController < ApplicationController
	before_action :authenticate_admin!

  def order_details_params
	params.require(:order_detail).permit(:order_history_id,:product_id,:tax_included,:number,:prepare_status)
  end
end
