class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_admin?

  def usuario_logado?
    redirect_to users_url if !user_signed_in?
  end

  def user_admin?
    if current_user&.adm? 
      redirect_to "/apollo"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome_usuario, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nome_usuario, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
