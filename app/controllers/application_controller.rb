class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:about]
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		user_path(current_user.id) # ログイン後に遷移するpathを設定
    end

  	protected
  		def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:postcode, :prefecture_code, :address_city, :address_street, :address_building,:latitude,:longitude])
  	end
end
