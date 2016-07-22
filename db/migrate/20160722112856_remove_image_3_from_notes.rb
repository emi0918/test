class RemoveImage3FromNotes < ActiveRecord::Migration
  def change
  	 remove_column :notes, :image_3
  end
end
