Rails.application.routes.draw do

  resources :users
  resources :attractions
  resources :rides, only: [:create]
  get '/', to: 'users#create', as: 'root'
  get "/signup", to: "users#new", as: "signup"
  get "/signin", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  post "/rides/new", to: "rides#create"
end
