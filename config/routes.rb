Rails.application.routes.draw do
  resources :bags
  resources :users
  resources :cymbals

   #users/:id/bags/:bag_id
  # resources :users, only: [:show] do
  #   resources :bags, only: [:show, :index]
  # end

  resources :bags do
    resources :cymbals
  end

  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  get '/signup', to: 'users#new', as: 'signup'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/cymbals/new', to: 'cymbals#new'
  post '/cymbals/new', to: 'cymbals#create'
  # post '/bags/new', to: 'bags#create'

  get '/auth/facebook/callback' => 'sessions#create_with_fb'

end