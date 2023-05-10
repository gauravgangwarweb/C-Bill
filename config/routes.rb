Rails.application.routes.draw do
  resources :debts
  resources :customers
  devise_for :users
  get 'home' => 'home#index'

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
