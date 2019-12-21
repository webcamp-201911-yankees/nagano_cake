class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_up_path_for(resource)
		case resource
		when Admin
		"/admin"#サインアップ後に移動するpath
		when Customer
		"/products"#サインアップ後に移動するpath
		end
	end

	def after_sign_in_path_for(resource)
		case resource
		when Admin
		"/admin"#ログイン後に移動するpath
		when Customer
		"/products"#ログイン後に移動するpath
		end
	end
	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :admin
      		new_admin_session_path	#ログアウト後に移動するpath
    else
      		new_customer_session_path
  end
	end

	before_action :set_search

	def set_search #gemのransack用
		@categories = Category.all
	    @search = Product.ransack(params[:q]) #(params[:q])にはProductに関する検索パラメータが渡される
	    @results = @search.result.page(params[:page]).per(12) #@search.resultで検索結果が得られる
	end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email])
  end

end
