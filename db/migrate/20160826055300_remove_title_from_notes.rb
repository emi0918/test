class RemoveTitleFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :title
    remove_column :notes, :content
    remove_column :notes, :price
    remove_column :notes, :rule
    remove_column :notes, :catchcopy
    remove_column :notes, :salespoint
    remove_column :notes, :cancelrule
    remove_column :notes, :category_id
    
  end
end
