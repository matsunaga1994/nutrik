class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.text :text
      t.references :food, foreign_key: true
      t.timestamps
    end
  end
end