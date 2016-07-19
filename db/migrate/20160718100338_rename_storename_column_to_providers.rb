class RenameStorenameColumnToProviders < ActiveRecord::Migration
  def change
  	  rename_column :providers, :storename, :name
  end
end
