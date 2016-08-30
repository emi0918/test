class AddNoteIdToNoteRevisions < ActiveRecord::Migration
  def change
    add_column :note_revisions, :note_id, :integer
      add_column :note_revisions, :category_id, :integer
    add_column :note_revisions, :title, :string
    add_column :note_revisions, :content, :text
     add_column :note_revisions, :price, :integer
    add_column :note_revisions, :rule, :text
        add_column :note_revisions, :catchcopy, :text
    add_column :note_revisions, :salespoint, :text
   add_column :note_revisions, :cancelrule, :text
  end
end
