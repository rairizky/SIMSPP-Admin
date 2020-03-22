class IndexController < ApplicationController
  def home
    if user_signed_in?
      if current_user.role == "admin"
        redirect_to admin_home_path
      elsif current_user.role == "rayon"
        redirect_to rayon_home_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
