Rails.application.routes.draw do
  ### Users can be created/destroyed
  resources :users, only: [:new, :create, :destroy, :show] do
    resources :inventions
  end
  ### Inventions can be created or destroyed and will index all inventions with filter for inventor 
  resources :inventions, only: [:index, :show] 
    ## comments and instructions will be nested on the invention show page
  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
