class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  #access page superadmin
  def authorize_superadmin
    unless !current_user.role == "superadmin"
      redirect_to home_path, alert: 'Super Admin only!'
    end
  end

  #access page admin
  def authorize_admin
    unless !current_user.role == "admin"
      redirect_to home_path, alert: 'Admin only!'
    end
  end

  #access page rayon
  def authorize_rayon
    unless !current_user.role == "rayon"
      redirect_to home_path, alert: 'Rayon only'
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:username, :email, :password, :rayon) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :rayon) }
  end
end
