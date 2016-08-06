class RemoveServiceImage1FromProviders < ActiveRecord::Migration
  def change
  	remove_column :providers, :provider_pic
  end
end
