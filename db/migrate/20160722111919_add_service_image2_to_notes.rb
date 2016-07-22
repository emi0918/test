class AddServiceImage2ToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :service_image2, :text
  end
end
