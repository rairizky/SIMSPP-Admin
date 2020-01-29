class SuperadminController < ApplicationController
  before_action :authenticate_user!

  def home
    has_role
  end

  def admin
    has_role
    @daftar_admin = User.all.where(role: 'admin')
    @admin = User.new

  end

  def add_admin
    @admin = User.create(admin_params)
    if @admin.save
      redirect_to superadmin_admin_path, notice: 'Tambah Admin sukses.'
    else
      redirect_to superadmin_admin_path, alert: "Tidak dapat menambahkan admin."
    end
  end

  def delete_admin
    @accountFind = User.find(params[:id])
    if @accountFind.destroy
      redirect_to superadmin_admin_path, notice: "Akun berhasil dihapus."
    else
      redirect_to superadmin_admin_path, alert: "Akun gagal dihapus."
    end
  end

  def rayon
    has_role
    @daftar_rayon = User.all.where(role: 'rayon')
    @rayon = User.new
  end

  def add_rayon
    @add_rayon = User.new(rayon_params)
    if @add_rayon.save
      redirect_to superadmin_rayon_path, notice: "Tambah Rayon success."
    else
      redirect_to superadmin_rayon_path, alert: "Tidak dapat menambahkan Rayon."
    end
  end

  def delete_rayon
    @account = User.find(params[:id])
    if @account.destroy
      redirect_to superadmin_rayon_path, notice: "Akun berhasil dihapus."
    else
      redirect_to superadmin_rayon_path, alert: "Akun gagal dihapus."
    end
  end

  def role
    has_role
    @roles = Role.all
    @role = Role.new
  end

  def add_role
    @role = Role.new(role_params)
    if @role.save
      redirect_to superadmin_role_path, notice: "Tambah Rayon success."
    else
      redirect_to superadmin_role_path, alert: "Rayon sudah ada."
    end
  end

  def edit_role
    @role = Role.find(params[:id])
  end

  def update_role
    @role = Role.find(params[:id])
    if @role.update(role_params)
      redirect_to superadmin_role_path, notice: "Update Rayon success."
    else
      redirect_to superadmin_role_path, alert: "Gagal mengupdate Rayon. "
    end
  end

  def delete_role
    @find_id = Role.find(params[:id])
    if @find_id.destroy
      redirect_to superadmin_role_path, notice: "Rayon berhasil dihapus."
    else
      redirect_to superadmin_role_path, alert: "Rayon gagal dihapus."
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

  def role_params
    params.require(:role).permit(:name)
  end

end
