class AddProviderIdToProviderAccounts < ActiveRecord::Migration
  def change
  		add_column :provider_accounts, :provider_id,:string
  end
end
