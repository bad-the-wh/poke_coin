class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add any additional attributes or associations here
  has_many :pokemons
  has_many :transactions
  attribute :wallet, :integer, default: 0
end
