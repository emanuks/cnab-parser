class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :tx_type, limit: 1
      t.date :tx_date
      t.decimal :tx_value
      t.string :cpf, limit: 11
      t.string :bank_card, limit: 12
      t.time :tx_time
      t.string :owner_name, limit: 14
      t.string :store_name, limit: 19

      t.timestamps
    end
  end
end
