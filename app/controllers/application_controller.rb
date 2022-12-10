class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def usuario_logado?
    redirect_to users_url if !user_signed_in?
  end

  def retornar_tentativa
    
    if current_user&.tentativas&.last&.nil?  
      redirect_to "/"
    elsif !current_user&.tentativas&.last&.finalizado?
      redirect_to "/tentativa/#{current_user&.tentativas&.last&.id}"
    end

  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome_usuario, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nome_usuario, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
