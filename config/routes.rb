Rails.application.routes.draw do
  devise_for :users
  get 'rayon/home', to: 'rayon#home', as: 'rayon_home'

  #admin
  get 'admin/home', to: 'admin#home', as: 'admin_home'
  post 'admin/home/import', to: 'admin#importfile', as: 'import_file'
  delete  'admin/truncate', to: 'admin#truncate_file', as: 'truncate_file'

  #superadmin
  get 'superadmin/', to: 'superadmin#home', as: 'superadmin_home'

  get 'superadmin/admin', to: 'superadmin#admin', as: 'superadmin_admin'
  post 'superadmin/home/addAdmin', to: 'superadmin#add_admin', as: 'superadmin_add_admin'
  delete 'superadmin/home/deleteAdmin/:id', to: 'superadmin#delete_admin', as: 'superadmin_delete_account_admin'

  get 'superadmin/rayon', to: 'superadmin#rayon', as: 'superadmin_rayon'
  post 'superadmin/home/addRayon', to: 'superadmin#add_rayon', as: 'superadmin_add_rayon'
  delete 'superadmin/home/deleteRayon/:id', to: 'superadmin#delete_rayon', as: 'superadmin_delete_account_rayon'


  get 'superadmin/role', to: 'superadmin#role', as: 'superadmin_role'
  get 'superadmin/role/edit/:id', to: 'superadmin#edit_role', as: 'superadmin_edit_role'
  post 'superadmin/addRole', to: 'superadmin#add_role', as: 'superadmin_add_role'
  patch 'superadmin/updateRole/:id', to: 'superadmin#update_role', as: 'superadmin_update_role'
  delete 'superadmin/role/delete/:id', to: 'superadmin#delete_role', as: 'superadmin_delete_role'

  root 'home#index', to: 'home#index', as: 'home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # api
  post 'api/signin/', to: 'api#apisignin'
  get 'api/siswa/daftarsiswa', to: 'api#tagihansiswa'

end
