class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_up_path_for(resource)
		case resource
		when Admin
		"/admin/products"#サインアップ後に移動するpath
		# flash[:signedup] ="Welcome! You have signed up successfully."
		when Customer
		"/products"#サインアップ後に移動するpath
		# flash[:signedup] ="Welcome! You have signed up successfully."
		end
	end

	def after_sign_in_path_for(resource)
		case resource
		when Admin
		"/admin/products"#ログイン後に移動するpath
		# flash[:signedup] ="Welcome! You have signed up successfully."
		when Customer
		"/products"#ログイン後に移動するpath
		# flash[:signedin] ="Signed in successfully."
		end
	end
	def after_sign_out_path_for(resource)
		"/customers/sign_in"#ログアウト後に移動するpath
		# flash[:signedin] ="Signed in successfully."
	end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email])
  end

end
