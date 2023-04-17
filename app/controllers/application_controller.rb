class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    about_path
    # サインイン先を変える
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  
  # サインアップ時のemailを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  
  
end
