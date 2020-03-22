Rails.application.routes.draw do
  root 'index#home'
  devise_for :users
  get 'rayon/dashboard', to: 'rayon#home', as: 'rayon_home'
  get 'admin/dashboard', to: 'admin#home', as: 'admin_home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #list tagihan siswa
  get 'admin/tagihan/list', to: 'admin#tagihan', as: 'list_tagihan'
  #list akun
  get 'admin/akun/list', to: 'admin#akun', as: 'list_akun'
  #list role
  get 'admin/akun/role', to: 'admin#role', as: 'list_role'
  get 'admin/akun/rayon', to: 'admin#rayonadmin', as: 'list_rayon'
  post 'admin/akun/rayon/add', to: 'admin#rayonadminadd', as: 'add_rayon'

  #rayon daftar siswa
  get 'rayon/siswa/list', to: 'rayon#siswa', as: 'rayon_list_siswa'
  #rauon tagihan siswa
  get 'rayon/tagihan/list', to: 'rayon#tagihan', as: 'rayon_list_tagihan'
end
