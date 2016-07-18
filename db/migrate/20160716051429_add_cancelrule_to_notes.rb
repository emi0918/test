class AddCancelruleToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :cancelrule, :string
  end
end
