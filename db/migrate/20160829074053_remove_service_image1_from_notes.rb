class RemoveServiceImage1FromNotes < ActiveRecord::Migration
  def change
  	remove_column :notes, :service_image1
  	remove_column :notes, :service_image2
  	remove_column :notes, :service_image3
  	remove_column :notes, :category
end
end