class AddServiceImage3ToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :service_image3, :text
  end
end
