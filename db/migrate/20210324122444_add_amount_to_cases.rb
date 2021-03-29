class AddAmountToCases < ActiveRecord::Migration[6.1]
  def change
    add_monetize  :cases, :target_amount, currency: { present: false }
  end
end
