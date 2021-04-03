class AddCheckoutSessionIdToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :checkout_session_id, :string
  end
end
