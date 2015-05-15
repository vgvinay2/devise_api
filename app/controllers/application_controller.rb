class ApplicationController < ActionController::API
#added by gourav  but not needed b/c already added in registration controller 
# 	def configure_permitted_parameters
# devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name) }
# end

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
   # registration_params = [:user_name, :email, :password, :password_confirmation]
     registration_params = [:user_name, :email, :first_name, :last_name, :company_name, :country, :business_phone]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
          |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
          |u| u.permit(registration_params)
      }
    end
  end
end
