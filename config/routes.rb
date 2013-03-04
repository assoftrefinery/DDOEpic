Ddoepic::Application.routes.draw do
 
  get "home/index"

  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  match 'items_chrono' => 'items#show_chrono', :as => :show_chrono
  match 'items_carnival' => 'items#show_carnival', :as => :show_carnival
  match 'items_sands' => 'items#show_sands', :as => :show_sands
  match 'items_sentinels' => 'items#show_sentinels', :as => :show_sentinels
  match 'items_redfens' => 'items#show_redfens', :as => :show_redfens
  match 'items_von' => 'items#show_von', :as => :show_von
  match 'items_web' => 'items#show_web', :as => :show_web
  match 'acercade' => 'home#acercade', :as => :acercade
  match 'items_completos' => 'items#show_completos', :as => :showcompletos

  resources :sessions

  resources :users
  
   resources :items
    resources :locations
      resources :itemnames

  post "dynamic_districts/:id" => "items#dynamic_districts"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
