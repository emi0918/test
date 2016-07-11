class AddStorenameToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :storename, :string
  end
end
