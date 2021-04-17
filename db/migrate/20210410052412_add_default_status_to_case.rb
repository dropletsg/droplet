class AddDefaultStatusToCase < ActiveRecord::Migration[6.1]
  def change
    change_column :cases, :status, :string, :default => 'new'
  end
end
