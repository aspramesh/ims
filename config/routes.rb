Rails.application.routes.draw do 
 
 #post 'employee/index'
 # index_employee GET  employee/index(:format) as employee#index

  get 'pages/about'
  get 'pages/accessdenied'
  get 'pages/home'
  get 'pages/logout'
  get 'pages/login'

  resources :projects
  resources :applications
  resources :applicationversions
  resources :modules
  resources :programs
  resources :employees
  resources :companies
  resources :designations
  resources :departments
  resources :requesttypes
  resources :issuelabels
  resources :issuesources
  resources :issuestatuses
  resources :issuetags
  resources :notetypes
  resources :priorities
  resources :customers
  resources :imsconfigs

  match ':controller(/:action(/:id))', :via=> [:get, :post]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'pages#login'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
