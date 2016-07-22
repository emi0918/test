class AddNoteIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :note_id, :integer
  end
end
