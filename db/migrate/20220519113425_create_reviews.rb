class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false
      t.references :cook, null: false
      t.float :rate, null: false, default: 0
      t.text :comment, null: false
      t.timestamps
    end
  end
end
