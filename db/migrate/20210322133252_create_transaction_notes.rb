class CreateTransactionNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_notes do |t|
      t.text :content
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
