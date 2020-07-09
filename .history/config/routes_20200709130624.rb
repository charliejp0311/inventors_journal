Rails.application.routes.draw do
  ## main page
  root 'sessions#index'
  ## category needs
  resources :categories, only: [:index, :show]
  ## signing in and out
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create', via:[:get,:post]
  
  ### Users can be created/destroyed
  resources :users, only: [:new, :create, :destroy, :show] do
    ##a user has complete access to invention routes that exist in controller
    resources :inventions, only: [:show, :create, :destroy, :new]
  end
  
  ## routes specifically for the inventions controller 
  post '/problems', to: 'inventions#create_prob'
  post '/solutions', to: 'inventions#create_solution'
  
  resources :inventions, only: [:index, :show, :create] 

end
