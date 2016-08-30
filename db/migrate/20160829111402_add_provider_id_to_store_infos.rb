class AddProviderIdToStoreInfos < ActiveRecord::Migration
  def change
  	add_column :store_infos, :provider_id,:string
  end
end
