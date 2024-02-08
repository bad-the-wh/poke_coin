class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Add any additional attributes or associations here
  has_many :pokemons
  has_many :transactions
  attribute :wallet, :integer, default: 0
end
