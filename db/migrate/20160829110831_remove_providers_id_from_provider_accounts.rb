class RemoveProvidersIdFromProviderAccounts < ActiveRecord::Migration
  def change
  		remove_column :provider_accounts, :providers_id
  end
end
