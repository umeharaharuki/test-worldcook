class CreateCooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cooks do |t|
      t.string  :cook_name,  null: false
      t.text    :recipe,     null: false
      t.text    :material,   null: false
      t.integer :country_id, null: false
      t.integer :serving_id, null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
