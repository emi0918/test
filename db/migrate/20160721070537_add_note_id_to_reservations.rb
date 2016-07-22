class AddNoteIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :note_id, :string
  end
end
