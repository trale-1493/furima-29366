class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,           null: false
      t.string  :image,          null: false
      t.integer :value,          null: false
      t.text    :explain,        null: false
      t.integer :category,       null: false
      t.integer :condition,      null: false
      t.integer :delivery_payer, null: false
      t.integer :region,         null: false
      t.integer :delivery_span,  null: false
      t.timestamps
    end
  end
end