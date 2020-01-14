class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインアップ後のpath
  def after_sign_up_path_for(resource)
    user_path(@user)
  end

  # ログイン後のpath
  def after_sign_in_path_for(resource)
    user_path(@user)
  end

  # ログアウト後のpath
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :which, :sex, :prefecture, :user_image_id, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :which, :sex, :prefecture, :user_image_id, :introduction])
  end


end