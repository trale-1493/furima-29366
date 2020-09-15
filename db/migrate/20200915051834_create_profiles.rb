class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text       :intoroduction
      t.string     :hobby
      t.string     :life_word
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
