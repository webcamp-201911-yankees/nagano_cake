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

	def set_search
		@categories = Category.all
		# search1はカテゴリーの有効・無効や商品の販売中・停止を反映した上topページでランサックを用いたワード検索するための記述
		@search1 = Product.ransack(params[:q])
		
		# search2はカテゴリーの有効・無効や商品の販売中・停止を反映した上でカテゴリー検索するための記述
	    @search2 = Product.joins(:category).where('categories.status = ? AND sale_status = ?', 1, 0).ransack(params[:q])
	    @results1 = @search1.result.page(params[:page]).per(12)
	    @results2 = @search2.result.page(params[:page]).per(12)
	end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email])
  end

end
