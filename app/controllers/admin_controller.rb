class AdminController < ApplicationController
  before_action :authenticate_user!

  def home

  end

  def tagihan
    @no = 0
    @tagihan = Tagihan.paginate(page: params[:page], per_page: 5)
    @totalsiswa = Tagihan.count

    render :'admin/layout/tagihan'
  end

  def akun
    @akun = User.paginate(page: params[:page], per_page: 5)
    @totalakun = User.count


    render :'admin/layout/akun'
  end

  def role
    render :'admin/layout/role'
  end

  def rayonadmin
    @no = 0
    @rayon = Rayon.paginate(page: params[:page], per_page: 5)
    @totalrayon = Rayon.count

    @addrayon = Rayon.new
    render :'admin/layout/rayon'
  end

  def rayonadminadd
    @addrayon = Rayon.create(rayon_params)

    if @addrayon
      redirect_to list_rayon_path
    end
  end

  def rayonadmindelete

  end

  private
  def rayon_params
    params.require(:rayon).permit(:nama_rayon)
  end
end
