class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                   null: false, default: ""
      t.text       :text,                   null: false
      t.integer    :category_id,            null: false, default: 1
      t.integer    :condition_id,           null: false, default: 1
      t.integer    :including_postage_id,   null: false, default: 1
      t.integer    :consignor_location_id,  null: false, default: 1
      t.integer    :ready_time_id,          null: false, default: 1
      t.integer    :price,                  null: false, default: 1
      t.references :user,                   foreign_key: true

      t.timestamps
    end
  end
end