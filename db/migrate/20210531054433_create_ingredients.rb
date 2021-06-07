class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name,           null: false
      t.integer :food_group_id, null: false
      t.string :amount,         null: false
      t.references :food,       null: false, foreign_key: true
      t.timestamps
    end
  end
end