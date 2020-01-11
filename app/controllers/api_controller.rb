class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def apisignin
    user = User.find_for_authentication(email: params[:email])

    if user.valid_password?(params[:password])
      render :json => {:user => [user], :success => '1', :message => 'success'}
    else
      render :json => {:success => '0', :message => 'error'}
    end
  end

  def tagihansiswa
    @tagihan = Tagihan.all.order('nama ASC')

    render :json => {:siswa => @tagihan}
  end

end