Pictures::Application.routes.draw do
  
  root :to=>"site#index"
	
  #get
  get "id:id" => "users#index"
  get "id:id/edit_post" => "users#edit_post"
  get "id:id/new_post" => "users#new_post"
  get "users/sign_up" => "users#new"
  get "categories/:cat/:adress"=>"subcategories#show"
  get "categories/:cat" => "categories#show"
  # posts
  get ":cat/posts/:id" => "posts#show"
  
  #post
  post "users/create" => "users#create", :as=>:user_create
  post 'pict/save_tmp_image' => "picts#save_tmp_image"
  
  #put
  put 'post/save_tmp' => "posts#save_tmp"
  put "posts/create_pict" => "posts#create_pict"
  
  #delete
  delete "picts/:id" => "picts#destroy", :as=>:delete_pict
  delete "comments/:id" => "comments#destroy", :as=>:delete_comment
  
  resources :categories do
		resources :posts do
			resources :picts
			resources :comments
		end
	end
	resources :posts do
		resources :picts
		resources :comments
	end
  
  #devise
  devise_for :users
  ActiveAdmin.routes(self)
	devise_for :admin_users, ActiveAdmin::Devise.config
  # mount Mercury::Engine => '/'
  # devise_for :main_users, :as=>:user
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
