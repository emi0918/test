class AddWorkdate1ToReservations < ActiveRecord::Migration
  def change
  	   remove_column :reservations, :last_name
    remove_column :reservations, :first_name
  	  add_column :reservations, :workdate1, :string
    add_column :reservations,:workdate2, :string
    add_column :reservations, :workdate3, :string
     add_column :reservations, :worktime1, :string
      add_column :reservations, :worktime2, :string
       add_column :reservations, :worktime3, :string

  end
end
