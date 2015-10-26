Rails.application.routes.draw do
  root "teams#index"

  resources :users do
    resources :teams, shallow:true
  end
  resources :superheros

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/logout", to: "users#logout"
  get "/login", to: "users#login"
  post "/login", to:"users#attempt_login"
end
