class AddCaseIdToCaseContributors < ActiveRecord::Migration[6.1]
  def change
    add_reference :case_contributors, :case, index: true, foreign_key: true
  end
end
