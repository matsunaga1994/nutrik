class FoodIngredientRecipe
  include ActiveModel::Model
  attr_accessor :title, :image, :cook_time_id, :cost_id, :comment, :user_id, :name, :food_group_id, :text

  with_options presence: true do
    validates :title
    validates :image
    validates :cook_time_id
    validates :cost_id
    validates :comment
    validates :user_id
    validates :name
    validates :food_group_id
    validates :text 

  end

  def save
    food = Food.create(title: title, image: image, cook_time_id: cook_time_id, cost_id: cost_id, comment: comment, user_id: user_id)
    # Ingredient.create(name: name, food_group_id: food_group_id, food_id: food.id)
    name.length.times do |i|
      ingredient = Ingredient.new
      ingredient.food_id = food.id
      ingredient.name = name[i]
      ingredient.food_group_id = food_group_id[i]
      ingredient.save!
    end
    # Recipe.create(text: text, food_id: food.id)
    text.length.times do |i|
      recipe = Recipe.new
      recipe.food_id = food.id
      recipe.text = text[i]
      recipe.save!
    end
  end
end