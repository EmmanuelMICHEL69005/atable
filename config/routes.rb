Rails.application.routes.draw do


  devise_for :users, controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions',
   omniauth_callbacks: 'users/omniauth_callbacks'
 }

  root to: 'pages#home'

  resources :embeds, only: [:new, :create]

  resources :bookings, only: [:index, :create, :new, :destroy] do
      resources :customers, only: [:show]
  end

  resources :customers, only: [:create, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ...
  mount Facebook::Messenger::Server, at: 'bot'

end

