class AddImage1toNotes < ActiveRecord::Migration
  def change
  add_column :notes, :image_1, :text
  add_column :notes, :image_2, :text
  add_column :notes, :image_3, :text
   add_column :notes, :rule, :text
       add_column :notes, :user_id, :string
    add_column :notes, :provider_id, :string
  end
end

