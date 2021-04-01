class AddCallDoneToCases < ActiveRecord::Migration[6.1]
  def change
    add_column :cases, :call_done, :boolean
  end
end
