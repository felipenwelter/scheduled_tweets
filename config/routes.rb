Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "about-us", to: "about#index", as: :about # this will go to /app/controllers/about_controller.rb, method index

  get "contact-us", to: "contact#index", as: :contact
  #get "see on url", to: "controller#method", as "route"
    # then create a controller named "contact_controller" and a view under /views/contact/ called index.html.erb

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  root to: "main#index"
  # get "/", to: "main#index"

end
