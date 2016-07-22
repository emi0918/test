class AddNameToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :name, :string
  end
end
