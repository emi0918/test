class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :price
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :category
      t.text :rule
      t.string :user_id,null: false, default: ""
      t.string :provider_id,null: false, default: ""
    end
  end
end


