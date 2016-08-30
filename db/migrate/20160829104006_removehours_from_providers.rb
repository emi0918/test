class RemovehoursFromProviders < ActiveRecord::Migration
  def change

  	remove_column :providers, :holiday
  	remove_column :providers, :payment
  	 remove_column :providers, :about
  	remove_column :providers, :email
  	remove_column :providers, :phonenumber

  end
end
