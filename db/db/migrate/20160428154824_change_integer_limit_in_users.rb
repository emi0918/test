class ChangeIntegerLimitInUsers < ActiveRecord::Migration
   def change
    change_column :users, :uid, :integer, limit: 8

  end
end




