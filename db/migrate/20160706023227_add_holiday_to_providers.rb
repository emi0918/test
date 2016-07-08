class AddHolidayToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :holiday, :string
  end
end
