class RenameUserNameColumnToUsers < ActiveRecord::Migration
  def change
  	  rename_column :users, :user_name, :name
  end
end
