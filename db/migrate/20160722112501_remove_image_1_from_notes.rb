class RemoveImage1FromNotes < ActiveRecord::Migration
  def change
   remove_column :image_1, :text
  end
end
