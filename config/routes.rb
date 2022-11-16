Rails.application.routes.draw do
  get '/instrucoes', to: "instrucoes#index"
  get '/home', to: "home#index"
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
