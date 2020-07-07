Rails.application.routes.draw do
  resources :categories, only: [:index, :show, :create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post 'signout', to: 'sessions#destroy'
  ### Users can be created/destroyed
  resources :users, only: [:new, :create, :destroy, :show] do
    ##a user has complete access to invention routes that exist in controller
    resources :inventions, only: [:show, :create, :destroy,:new]
  end
  resources :problems, only: [:create]
  resources :solutions, only: [:create]
  ### Inventions can be displayed directly on index page with links to show page
  ### without being logged in but when logged in it will have more options 
  resources :inventions, only: [:index, :show, :create] do
    resources :problems, only: [:show, :create, :new]
    resources :category, only: [:create]
  end

  resources :problems, only: [:show] do
    resources :solutions, only: [:create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
