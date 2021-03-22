class CreateCoordinators < ActiveRecord::Migration[6.1]
  def change
    create_table :coordinators do |t|
      t.string :email
      t.string :name
      t.string :mobile_number
      t.text :description
      t.string :telegram_handle
      t.boolean :is_archived, default: false

      t.timestamps
    end
  end
end
