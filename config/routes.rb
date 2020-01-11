Rails.application.routes.draw do
  devise_for :users
  get 'rayon/home', to: 'rayon#home', as: 'rayon_home'

  #admin
  get 'admin/home', to: 'admin#home', as: 'admin_home'
  post 'admin/home/import', to: 'admin#importfile', as: 'import_file'

  #superadmin
  get 'superadmin/home', to: 'superadmin#home', as: 'superadmin_home'
  post 'superadmin/home/addAdmin', to: 'superadmin#add_admin', as: 'superadmin_add_admin'
  post 'superadmin/home/addRayon', to: 'superadmin#add_rayon', as: 'superadmin_add_rayon'

  root 'home#index', to: 'home#index', as: 'home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # api
  post 'api/signin/', to: 'api#apisignin'
  get 'api/siswa/daftarsiswa', to: 'api#tagihansiswa'

end
