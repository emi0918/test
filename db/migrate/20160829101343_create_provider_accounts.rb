class CreateProviderAccounts < ActiveRecord::Migration
  def change
    create_table :provider_accounts do |t|
    t.references :providers
      t.timestamps null: false
    end
  end
end
