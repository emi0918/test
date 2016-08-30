class RemoveProvidersIdFromStoreInfos < ActiveRecord::Migration
  def change
  		remove_column :store_infos, :providers_id
  end
end
