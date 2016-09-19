class ChangeDatatypeBuildingOfStoreInfos < ActiveRecord::Migration
  def change
  	  change_column :store_infos, :building, :string
  end
end
