class AddMainpicToProviders < ActiveRecord::Migration
  def change
  	 add_column :providers, :mainpic, :text
  end
end
