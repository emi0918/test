class AddMessageToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :message, :text
  end
end
