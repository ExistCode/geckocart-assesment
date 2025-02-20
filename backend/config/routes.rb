# Resources: https://www.theodinproject.com/lessons/ruby-on-rails-routing

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      # User routes
      post '/signup', to: 'users#create'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'

      # Cart routes
      resource :cart, only: [:show] do
        post 'add_item'
        delete 'remove/:item_id', to: 'carts#remove_item'
        put 'update/:item_id', to: 'carts#update_item'
      end

      # Order routes
      resources :orders, only: [:index, :create, :show]
    end
  end
end

