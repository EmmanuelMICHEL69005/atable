Rails.application.routes.draw do
root to: 'pages#home'

  devise_for :users, controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions',
   omniauth_callbacks: 'users/omniauth_callbacks'
 }



  resources :embeds, only: [:new, :create]


  resources :bookings, only: [:index, :create, :edit, :new, :update, :destroy] do

      resources :customers, only: [ :show]
  end

  resources :customers, only: [:index, :create, :show, :edit] do
      resources :reviews, only: [:index, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ...
  mount Facebook::Messenger::Server, at: 'bot'

end

