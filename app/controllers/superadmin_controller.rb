class SuperadminController < ApplicationController
  before_action :authenticate_user!

  def home
    has_role

    @daftar_admin = User.all.where(role: 'admin')
    @daftar_rayon = User.all.where(role: 'rayon')
    @admin = User.new
    @rayon = User.new
  end

  def add_admin
    @admin = User.create(admin_params)
    if @admin
      redirect_to superadmin_home_path, notice: 'Add Admin success.'
    else
      redirect_to superadmin_home_path, notice: "Can't add Admin."
    end
  end

  def add_rayon
    @add_rayon = User.new(rayon_params)
    if @add_rayon
      redirect_to superadmin_home_path, notice: "Add Rayon success"
    else
      redirect_to superadmin_home_path, notice: "Can't add Admin."
    end
  end

  def has_role
    if current_user.role == 'admin'
      redirect_to admin_home_path
    elsif current_user.role == 'rayon'
      redirect_to rayon_home_path
    end
  end

  private
  def admin_params
    params.require(:user).permit(:username, :email, :password, :role)
  end

  def rayon_params
    params.require(:user).permit(:username, :email, :password, :role, :rayon)
  end

end
