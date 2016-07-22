class AddServiceImage1ToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :service_image1, :text
  end
end
