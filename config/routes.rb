Rails.application.routes.draw do
  get '/tentativa', to: "tentativa#index"
  get '/instrucoes', to: "instrucoes#index"
  root "home#index"
  
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
