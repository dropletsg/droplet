class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_number, :string
    add_column :users, :telegram_handle, :string
    add_column :users, :is_archived, :boolean, default: false
  end
end
