class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.string :email
      t.string :name
      t.string :alias
      t.string :mobile_number
      t.text :description
      t.string :id_type
      t.boolean :id_valid, default: false
      t.string :payment_link
      t.boolean :is_archived, default: false

      t.timestamps
    end
  end
end
