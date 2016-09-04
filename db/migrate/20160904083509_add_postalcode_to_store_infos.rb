class AddPostalcodeToStoreInfos < ActiveRecord::Migration
  def change
    add_column :store_infos, :postalcode, :integer
    add_column :store_infos, :prefecture, :string
    add_column :store_infos, :city, :string
    add_column :store_infos, :address, :string
    add_column :store_infos, :building, :integer

  end
end
