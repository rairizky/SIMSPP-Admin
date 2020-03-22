class RayonController < ApplicationController
  before_action :authenticate_user!

  def home
    #title page rayon
    @titleRayon = "Pemb. Rayon"
  end

  def siswa
    @no = 0
    @siswa = Siswa.paginate(page: params[:page], per_page: 5)
    render :'rayon/layout/siswa'
  end

  def tagihan
    @no = 0
    @tagihan = Tagihan.paginate(page: params[:page], per_page: 5)

    render :'rayon/layout/tagihan'
  end
end
