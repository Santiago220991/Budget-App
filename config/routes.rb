Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :home, only: [:index]
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  resources :expenses, only: [:new, :create, :edit, :update, :edit, :update, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
