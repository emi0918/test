class AddImage1ToNoteImages < ActiveRecord::Migration
  def change
    add_column :note_images, :image1, :text
    add_column :note_images, :image2, :text
    add_column :note_images, :image3, :text
    add_column :note_images, :image4, :text
    add_column :note_images, :image5, :text
    add_column :note_images, :image6, :text
    add_column :note_images, :image7, :text
    add_column :note_images, :image8, :text
    add_column :note_images, :image9, :text
  end
end
