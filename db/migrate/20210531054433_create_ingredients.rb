class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :category_id
      t.references :food, foreign_key: true
      t.timestamps
    end
  end
end