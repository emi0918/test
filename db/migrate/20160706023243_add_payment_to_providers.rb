class AddPaymentToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :payment, :string
  end
end
