class AddAmountToPayments < ActiveRecord::Migration[6.1]
  def change
    add_monetize  :payments, :amount, currency: { present: false }
  end
end
