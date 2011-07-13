Blog::Application.routes.draw do

  root :to => 'posts#index'

  devise_for :admin_users

  resources :comments

  # con esto estas diciendo que: cualquier enlace que lleve al controlador posts y accion search_result va a asignares a la ruta /posts/search. Los parametros que se pasen se le añaden tb a la ruta.
  match '/posts/search', :to => 'posts#search_result'  # esta linea siempre tiene que estar antes que resources :posts para tener mas prioridad y que no se interprete search como parámetro id.

  resources :posts

  match '/about_me', :to => 'basic_pages#about_me'

  match '/contact', :to => 'basic_pages#contact'

  match '/sessions', :to => 'sessions#destroy'

  match '/auth/:provider/callback', :to => 'sessions#create'


  match '/comments/:id/:post_id', :to => 'comments#eliminar'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
