class RemoveImage1FromNotes < ActiveRecord::Migration
  def change
   remove_column :notes, :image_1, :text
  end
end
