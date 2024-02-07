class PokemonController < ApplicationController
    before_action :set_pokemon, only: [:show, :checkout]
  
    def index
      @pokemon_list = Pokemon.all
      render json: @pokemon_list
    end
  
    def show
      # Show a specific Pokemon
      render json: @pokemon
    end
  
    def checkout
        if @pokemon.user == current_user
          render json: { success: false, message: 'You already own this Pokemon.' }
        else
          # Proceed with the purchase
          # You can redirect to the buy action in TransactionsController or handle the purchase logic directly
        end
    end
  
    private
  
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end
  end
  