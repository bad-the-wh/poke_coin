class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :action, null: false, default: 'buy'
      t.references :user, foreign_key: true
      t.references :pokemon, foreign_key: true

      t.timestamps
    end

    add_index :transactions, :action
  end
end
