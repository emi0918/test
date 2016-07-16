class AddSalespointToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :salespoint, :string
  end
end
