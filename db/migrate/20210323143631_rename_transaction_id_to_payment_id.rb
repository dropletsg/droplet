class RenameTransactionIdToPaymentId < ActiveRecord::Migration[6.1]
  def change
    rename_column :payment_notes, :transaction_id, :payment_id
  end
end
