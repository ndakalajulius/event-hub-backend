Rails.application.routes.draw do
  resources :tickets,only:[:index,:show,:create]
  resources :events
  # resources :users
  post"/login", to: "sessions#create"
  delete"/logout", to: "sessions#destroy"

  post"/signup", to: "users#create"

  get"/me", to: "users#show"

  get"/events", to: "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
