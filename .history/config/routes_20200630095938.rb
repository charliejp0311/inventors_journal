Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy] do
    resources :inventions, only: [:new, :create, :destroy, :index]
  end
  resources :inventions, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
