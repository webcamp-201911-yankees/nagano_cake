class Admin::CategoriesController < ApplicationController
	class Admin::CategoriesController < ApplicationController
	def index
		@categories = Category.all
		@category = Category.new
	end
	def new
	end
	def create
		@category = Category.find_or_initialize_by(id: category_params[:id])
		if @category.new_record?
			@category = Category.new(category_params)
			@category.save
		else
			@category.update(category_params)
		end
		redirect_to admin_categories_path

		# category = Category.new(category_params)
		# category.save
		# redirect_to admin_categories_path
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		redirect_to admin_categories_path
		# redirect_to request.referer
	end
	def destroy
		category = Category
	end
	def toggle_status
		@cate.toggle_status!
		redirect_to admin_categories_path
	end

	private
  def category_params
  	params.require(:category).permit(:name, :status)
  end
  def set_cate
  	@cate = Category.find(params[:id] || params[:category_id])
  end
end

end
