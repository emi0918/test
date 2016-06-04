class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|

      t.timestamps null: false
        t.string :price,              null: false, default: ""
      t.string :rule, null: false, default: ""
    end
  end
end
