class CreateNoteImages < ActiveRecord::Migration
  def change
    create_table :note_images do |t|
      t.references :note, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
