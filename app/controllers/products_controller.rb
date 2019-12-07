class ProductsController < ApplicationController
	def show
		@pruduct = Product.find(params[:id])
	end
end
