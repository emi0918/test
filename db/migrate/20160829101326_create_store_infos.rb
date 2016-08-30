class CreateStoreInfos < ActiveRecord::Migration
  def change
    create_table :store_infos do |t|
    t.references :providers
      t.timestamps null: false
    end
  end
end
