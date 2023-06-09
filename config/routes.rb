Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "about-us", to: "about#index", as: :about # this will go to /app/controllers/about_controller.rb, method index

  root to: "main#index"

end
