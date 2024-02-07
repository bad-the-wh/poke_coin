class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :image_path
      t.integer :weight
      t.integer :height
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
