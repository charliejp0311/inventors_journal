Rails.application.routes.draw do
  ## main page
  root 'categories#index'
  ## category needs
  resources :categories, only: [:index, :show]
  ## signing in and out
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create' 
  
  ### Users can be created/destroyed
  resources :users, only: [:new, :create, :destroy, :show] do
    ##a user has complete access to invention routes that exist in controller
    resources :inventions, only: [:show, :create, :destroy, :new, :index]
  end
  
  ## routes specifically for the inventions controller 
  
  get '/stats', to: 'inventions#stats', as: 'stats' 

  resources :inventions, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :problems, only: [:show]
    resources :solutions, only: [:create]
    delete '/problems/:id', to: 'problems#destroy', as: 'kill_prob'
  end
  resources :problems, only: [:show, :create, :destroy]
  resources :solutions, only: [:create]
  delete '/solutions/:id', to: 'solutions#destroy', as: 'clear_solution'
  delete '/problems/:id', to: 'problems#destroy', as: 'kill_prob'

end
