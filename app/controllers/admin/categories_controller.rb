class Admin::CategoriesController < ApplicationController
	def index
		@categories = Category.all
		@category = Category.new
	end
	def new
	end
	def create
		@category = Category.new(category_params)
			if @category.save
				redirect_to admin_categories_path
			else
				@categories = Category.all
				render :index
			end
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
		redirect_to admin_categories_path
		else
			render :edit
		end
	end
	def destroy
		category = Category
	end
	def toggle_status
		@category = Category.find(params[:category_id])
		# binding.pry
		 @category.update(status: @category.toggle_status)
		redirect_to admin_categories_path
	end

	private
  def category_params
  	params.require(:category).permit(:name, :status)
  end
end
