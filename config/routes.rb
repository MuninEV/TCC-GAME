Rails.application.routes.draw do
  get 'rank/index'
  get '/pontuacao', to: "pontuacao#pontuacao"
  get '/tentativa', to: "tentativa#index"
  get '/instrucoes', to: "instrucoes#index"
  get '/rank', to: "rank#index"
  root "home#index"
  post "/tentativa", to: "tentativa#criar_tentativa"
  post "/finalizar_tentativa", to: "tentativa#finalizar_tentativa"
  get "/tentativa_finalizada",to: "tentativa#tentativa_finalizada"
  get "/revisar", to: "revisao#revisao"
  
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users

  resources :tentativa
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
