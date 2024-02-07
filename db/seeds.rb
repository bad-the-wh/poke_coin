# Seed Users with Wallet
user1 = User.create(email: 'user1@example.com', password: 'password1', wallet: 1000)
user2 = User.create(email: 'user2@example.com', password: 'password2', wallet: 800)
user3 = User.create(email: 'user3@example.com', password: 'password3', wallet: 1200)

# Seed Pokemons
pokemon1 = Pokemon.create(name: 'Charmander', image_path: '/images/charmander.jpg', weight: 10, height: 5, price: 100, user: user1)
pokemon2 = Pokemon.create(name: 'Squirtle', image_path: '/images/squirtle.jpg', weight: 8, height: 4, price: 90, user: user2)
pokemon3 = Pokemon.create(name: 'Bulbasaur', image_path: '/images/bulbasaur.jpg', weight: 12, height: 6, price: 110, user: user3)

# Seed Transactions
Transaction.create(action: 'buy', user: user1, pokemon: pokemon2)
Transaction.create(action: 'sell', user: user2, pokemon: pokemon3)
Transaction.create(action: 'buy', user: user3, pokemon: pokemon1)
