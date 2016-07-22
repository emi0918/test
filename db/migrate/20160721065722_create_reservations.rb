class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.string :last_name
      t.string :first_name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
