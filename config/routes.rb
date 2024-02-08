Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, 
  
    controllers: {
          sessions: 'users/sessions'
        }

    get '/me', to: 'users#show'    
    
    authenticated :user do
      get '/me/add', to: 'users#add_money'
      patch '/me/add', to: 'users#recharge_wallet'
      get '/me/transactions', to: 'users#transactions'
      get '/pokemon/:id/checkout', to: 'pokemons#checkout'
      post '/pokemon/:id/buy', to: 'transactions#register_buy'
      post '/pokemon/:id/sell', to: 'transactions#register_sell'
    end

  resources :pokemon, only: [:index, :show] do
    member do
      get '/pokemon', to: 'pokemons#index'
      get '/pokemon/:id', to: 'pokemons#show'
    end
  end

end
