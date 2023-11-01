Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "about-us", to: "about#index", as: :about # this will go to /app/controllers/about_controller.rb, method index

  get "contact-us", to: "contact#index", as: :contact
  #get "see on url", to: "controller#method", as "route"
    # then create a controller named "contact_controller" and a view under /views/contact/ called index.html.erb

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update" #patch is what we know as update

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  delete "logout", to: "sessions#destroy"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  root to: "main#index"
  # get "/", to: "main#index"
  
  resources :twitter_accounts
  # creates index, show, new, create, edit, update and delete routes for us, eg:
  #get "twitter_account/:id"
  #delete "twitter_account/:id"
  
  resources :tweets


end
