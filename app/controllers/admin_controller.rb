class AdminController < ApplicationController
  before_action :authenticate_user!

  def home
    has_role

    if params[:search].blank?
      @daftar_tagihan = Tagihan.paginate(page: params[:page], per_page: 10).order('nama ASC')
    else
      @parameter = params[:search]
      @daftar_tagihan = Tagihan.all.where('cast(nis as text) LIKE :search', search: @parameter).paginate(page: params[:page], per_page: 10).order('nama ASC')

    end
    
    @tagihan = Tagihan.sum(:tagihan)
    @jumlah = Tagihan.all.count
  end

  def importfile
    if params[:file].blank?
      redirect_to admin_home_path, alert: "Pilih file dahulu."
    else
      result = Tagihan.import(params[:file])
      if result
        redirect_to superadmin_home_path, notice: "Import siswa berhasil."
      else
        redirect_to superadmin_home_path, alert: "Format harus .csv, .xls, .xlsx"
      end
    end
  end

  def truncate_file
    @truncate = Tagihan.destroy_all
    if @truncate.blank?
      redirect_to admin_home_path, alert: "Data sudah kosong."
    else
      redirect_to admin_home_path, notice: "Data Siswa berhasil dikosongkan."
    end
  end

  def has_role
    if current_user.role == 'superadmin'
      redirect_to superadmin_home_path
    elsif current_user.role == 'rayon'
      redirect_to rayon_home_path
    end
  end
end
