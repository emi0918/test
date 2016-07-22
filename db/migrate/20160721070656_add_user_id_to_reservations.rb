class AddUserIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :user_id, :string
  end
end
