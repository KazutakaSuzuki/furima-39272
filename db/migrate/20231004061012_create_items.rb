class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string  :item_name,     null: false
      t.text    :explain,       null: false
      t.integer :category_id,   null: false
      t.integer :quality_id,    null: false
      t.integer :fee_status_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :scheduled_id,  null: false
      t.integer :price,         null: false
    end
  end
end
