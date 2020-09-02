class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,              null: false
      t.integer :value,             null: false
      t.text    :explain,           null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :delivery_payer_id, null: false
      t.integer :region_id,         null: false
      t.integer :delivery_span_id,  null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end