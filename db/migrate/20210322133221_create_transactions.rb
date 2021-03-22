class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_reference
      t.string :payee_name
      t.string :currency
      t.integer :amount
      t.text :comment
      t.references :case, null: false, foreign_key: true
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
