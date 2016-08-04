class AddCatchcopyToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :catchcopy, :string
  end
end
