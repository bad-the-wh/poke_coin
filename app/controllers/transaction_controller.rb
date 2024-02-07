class TransactionsController < ApplicationController
    before_action :authenticate_user!
  
    def register_buy
        # Logic to register a buy transaction
        pokemon = Pokemon.find(params[:pokemon_id])
        buyer = current_user
        price = pokemon.price
    
        if buyer.wallet >= price
          buyer.update(wallet: buyer.wallet - price)
          Transaction.create(action: 'buy', user: buyer, pokemon: pokemon)
    
          @success = true
          @message = 'Buy transaction registered successfully.'
        else
          @success = false
          @message = 'Insufficient funds for the purchase.'
        end
    
        respond_to do |format|
          format.html { render 'register_buy' } # Render HTML view
          format.json { render json: { success: @success, message: @message } }
        end
      end
      
    def register_sell
        # Logic to register a sell transaction
        pokemon = Pokemon.find(params[:pokemon_id])
        seller = current_user
      
        if pokemon.user == seller
            price = pokemon.price
            seller.update(wallet: seller.wallet + price)
            Transaction.create(action: 'sell', user: seller, pokemon: pokemon)
      
            @success = true
            @message = 'Sell transaction registered successfully.'
        else
            @success = false
            @message = 'You do not own this Pokemon and cannot sell it.'
        end
      
        respond_to do |format|
        format.html { render 'register_sell' } # Render HTML view
        format.json { render json: { success: @success, message: @message } }
        end
    end
  end
  