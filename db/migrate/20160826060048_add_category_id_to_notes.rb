class AddCategoryIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :category_id, :string
  end
end
