class RenameTransactionReferenceColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :cases, :transaction_reference, :payment_reference
    rename_column :transactions, :transaction_reference, :payment_reference
  end
end
