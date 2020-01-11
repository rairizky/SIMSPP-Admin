class RayonController < ApplicationController
  before_action :authenticate_user!

  def home
    has_role
  end

  def has_role
    if current_user.role == 'superadmin'
      redirect_to superadmin_home_path
    elsif current_user.role == 'admin'
      redirect_to admin_home_path
    end
  end
end
