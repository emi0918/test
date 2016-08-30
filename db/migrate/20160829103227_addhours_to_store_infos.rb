class AddhoursToStoreInfos < ActiveRecord::Migration
  def change
  		add_column :store_infos, :hours, :string
  		add_column :store_infos, :holiday, :string
  	    add_column :store_infos, :payment, :string
  	    add_column :store_infos, :about, :text
  end
end
