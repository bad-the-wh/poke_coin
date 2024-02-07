Rails.application.routes.draw do
  root 'pokemon#index'

  devise_for :users, 
  
    controllers: {
          sessions: 'users/sessions'
        }

    resources :users do
      get 'add_money', on: :member
      patch 'recharge_wallet', on: :member
      get 'transactions', on: :member
    end

  resources :pokemon, only: [:index, :show] do
    member do
      get 'checkout'
      post 'buy'
      post 'sell'
    end
  end

  get '/me', to: 'users#show'
  get '/me/add', to: 'wallet#add'
  patch '/me/add', to: 'wallet#update'
  get '/me/transactions', to: 'transactions#index'

  # Additional routes for transaction registration
  post '/pokemon/:id/buy', to: 'transactions#register_buy'
  post '/pokemon/:id/sell', to: 'transactions#register_sell'
end
