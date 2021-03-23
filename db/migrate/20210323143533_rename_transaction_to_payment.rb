class RenameTransactionToPayment < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :payments
    rename_table :transaction_notes, :payment_notes
  end
end
