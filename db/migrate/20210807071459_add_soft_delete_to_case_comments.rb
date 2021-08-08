class AddSoftDeleteToCaseComments < ActiveRecord::Migration[6.1]
  def change
    add_column :case_comments, :is_soft_deleted, :boolean, default: false
  end
end
