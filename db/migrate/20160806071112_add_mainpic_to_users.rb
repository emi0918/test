class AddMainpicToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :mainpic, :text
  end
end
