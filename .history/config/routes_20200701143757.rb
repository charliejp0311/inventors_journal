Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  ### Users can be created/destroyed
  resources :users, only: [:new, :create, :destroy, :show] do
    ##a user has complete access to invention routes that exist in controller
    resources :inventions
  end

  ### Inventions can be displayed directly on index page with links to show page
  ### without being logged in but when logged in it will have more options 
  resources :inventions, only: [:index, :show] do
    resources :problems, only: [:show, :create, :new]
  end

  resources :problems, only: [:show] do
    resources :solutions, only: [:create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
