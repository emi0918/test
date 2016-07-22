class AddPhonenumberToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :phonenumber, :string
  end
end
