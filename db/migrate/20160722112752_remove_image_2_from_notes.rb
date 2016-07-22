class RemoveImage2FromNotes < ActiveRecord::Migration
  def change
  	  remove_column :notes, :image_2, :text
  end
end
