class CreateWorkerNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_notes do |t|
      t.text :content
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
