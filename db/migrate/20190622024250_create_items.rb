class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,       null: false
      t.text :description,   null: false
      t.integer :status,        null: false
      t.string :trade_status
      t.string :delivery_charge
      t.string :delivery_days
      t.string :size
      t.integer :price,      null: false
      t.string :sales_status
      t.references :brand,     foreign_key: true
      t.timestamps
    end
  end
end
