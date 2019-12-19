class OrderDetailsController < ApplicationController
	  before_action :authenticate_customer!
end
