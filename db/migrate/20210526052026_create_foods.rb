class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :title,    null: false
      t.integer :time_id, null: false
      t.integer :cost_id, null: false
      t.text :comment,    null: false
      t.text :ingredient, null: false
      t.text :recipe,     null: false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
