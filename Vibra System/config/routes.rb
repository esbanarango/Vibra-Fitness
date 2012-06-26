VibraSystem::Application.routes.draw do

  root to: 'static_pages#home'

  match '/about',   to: 'static_pages#about'
  match '/error', to: 'static_pages#error'

  resources :clients do
    resources :invoices
  end

  match '/clients_booking(.:format)',  to: 'clients#index_booking', via: 'GET', :as => "clients_booking"

  resources :employees
  resources :seats do
    resources :schedules, except: [:new]
  end
  match '/settings/seats/:seat_id/schedules/:date/new(.:format)',  to: 'schedules#new', via: 'GET', :as => "new_seat_schedule"
  match '/settings/seats/:seat_id/schedules(.:format)',  to: 'schedules#settings_index', via: 'GET', :as => "settings_seat_schedules"

  match '/schedules_fast(.:format)',  to: 'schedules#create_fast', via: 'POST', :as => "create_fast"



  #Settings
  match '/settings(.:format)',  to: 'settings#index', via: 'GET', :as => "settings"
  match '/settings/seats',  to: 'settings#seats', via: 'GET', :as => "seats_agenda"



  resources :plans
  resources :products
  resources :discounts

  resources :sessions, only: [:new, :create, :destroy]


  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete




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
