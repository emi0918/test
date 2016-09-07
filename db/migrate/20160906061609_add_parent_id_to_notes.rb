class AddParentIdToNotes < ActiveRecord::Migration
  def change
  	 	 add_column :notes,:parent_id, :integer
  end
end
