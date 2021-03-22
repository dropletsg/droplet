class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|
      t.string :title
      t.text :story_summary
      t.text :story
      t.date :start_date
      t.date :end_date
      t.integer :target_amount
      t.string :transaction_reference
      t.string :status
      t.string :category
      t.boolean :admin_approved, default: false
      t.references :worker, null: false, foreign_key: true
      t.references :coordinator, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
