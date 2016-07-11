class AddHoursToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :hours, :string
  end
end
