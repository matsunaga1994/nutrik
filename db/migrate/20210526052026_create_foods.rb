class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :title,    null: false
      t.integer :cook_time_id, null: false
      t.integer :cost_id, null: false
      t.text :comment,    null: false
      t.references :user,  null: false, foreign_key: true
      t.string :serving,        null: false
      t.timestamps
    end
  end
end
