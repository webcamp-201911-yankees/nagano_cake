class Admin::CustomerController < ApplicationController
  def index
  	@customers = Customer.all
  end
end
