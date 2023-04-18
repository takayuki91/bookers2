class ApplicationController < ActionController::Base
  
  # 権限の設定
  before_action :authenticate_user!, except: [:top, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice]
    user_path(@user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice]
    root_path
  end

  protected

  # サインアップ時のemailを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



end
