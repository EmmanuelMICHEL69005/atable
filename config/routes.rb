Rails.application.routes.draw do
  get "auth/:provider/callback", to: "sessions#googleAuth"
  get "auth/failure", to: redirect("/")

  devise_for :users, controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions',
   omniauth_callbacks: 'users/omniauth_callbacks'
 }

  root to: 'pages#home'
 # resources :users
  resources :bookings, only: [:index, :create, :new] do
      resources :customers, only: [:show]
  end

  resources :customers, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ...
  mount Facebook::Messenger::Server, at: 'bot'

end

