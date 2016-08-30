class AddEmailToProviders < ActiveRecord::Migration
  def change
  		add_column :providers, :email,:string
  end
end
