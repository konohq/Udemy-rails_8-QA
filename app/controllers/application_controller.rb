class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  #デフォルトの画面
  def after_sign_in_path_for(resource)
      questions_path
  end


  # protect

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end
end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.

