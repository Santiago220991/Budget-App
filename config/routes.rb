Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "groups#index"
  resources :groups, only: [:index, :show, :new, :create] do
  resources :expenses, only: [:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
