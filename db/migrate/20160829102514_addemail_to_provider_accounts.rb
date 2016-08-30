class AddemailToProviderAccounts < ActiveRecord::Migration
  def change
  	add_column :provider_accounts, :email, :string
  	add_column :provider_accounts, :phonenumber, :string
    add_column :provider_accounts, :staffname, :string
  end
end
