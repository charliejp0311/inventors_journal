Rails.application.routes.draw do
  ## main page
  root 'sessions#index'
  ## category needs
  resources :categories, only: [:index, :show, :create]
  ## signing in and out
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post 'signout', to: 'sessions#destroy'
  
  ### Users can be created/destroyed
  resources :users, only: [:new, :create, :destroy, :show] do
    ##a user has complete access to invention routes that exist in controller
    resources :inventions, only: [:show, :create, :destroy, :new]
  end
  
  post '/problems', to: 'inventions#create_prob'
  post '/solutions', to: 'inventions#create_solution'
  
  resources :inventions, only: [:index, :show] 

  resources :problems, only: [:show] do
    resources :solutions, only: [:create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
