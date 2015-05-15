class RegistrationsController < Devise::RegistrationsController

  respond_to 'json'
  prepend_before_filter :require_no_authentication, :only => [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  skip_before_action :verify_authenticity_token
  include ActionController::MimeResponds
  include ActionController::Cookies
  include ActionController::Helpers


  def create
#byebug
    build_resource(sign_up_params)
    if resource.save
        render :json => resource, :status => :successfully_saved

    else
      clean_up_passwords resource
      render :json => resource.errors, :status => :unprocessable_entity
    end
  end


  def after_sign_up_path_for(resource)
    puts "kkkkkkkk"
    format.json { render :json => resource.errors, :status => :unprocessable_entity }
  end
end