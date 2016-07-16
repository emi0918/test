class AddProviderPicToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :provider_pic, :string
  end
end
