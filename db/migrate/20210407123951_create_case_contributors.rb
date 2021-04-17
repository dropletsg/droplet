class CreateCaseContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :case_contributors do |t|
      t.string :name
      t.text :email

      t.timestamps
    end
  end
end
