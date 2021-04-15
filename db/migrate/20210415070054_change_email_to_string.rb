class ChangeEmailToString < ActiveRecord::Migration[6.1]
  def change
    change_column :case_contributors, :email, :string
  end
end
