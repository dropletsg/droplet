class CreateCaseNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :case_notes do |t|
      t.text :content
      t.references :case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
