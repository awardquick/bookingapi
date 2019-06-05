class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.string :title
      t.money :cost
      t.datetime :start
      t.text :cancellation_reason
      t.boolean :refunded
      t.references :employee, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
