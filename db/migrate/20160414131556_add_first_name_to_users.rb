class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_pic, :text
    add_column :users, :profile, :text
    add_column :users, :area, :string
  end
end
