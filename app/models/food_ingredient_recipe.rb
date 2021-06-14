class FoodIngredientRecipe
  include ActiveModel::Model
  attr_accessor :title, :images, :cook_time_id, :cost_id, :comment, :user_id, :serving, :amount, :name, :food_group_id, :text

  with_options presence: true do
    validates :title
    validates :images
    validates :cook_time_id
    validates :cost_id
    validates :comment
    validates :user_id
    validates :serving
  end

  def save(name, food_group_id, amount, text)
    food = Food.create(title: title, images: images, cook_time_id: cook_time_id, cost_id: cost_id, comment: comment, user_id: user_id, serving: serving)

    name.length.times do |i|
      ingredient = Ingredient.new
      ingredient.food_id = food.id
      ingredient.name = name[i]
      ingredient.food_group_id = food_group_id[i]
      ingredient.amount = amount[i]
      ingredient.save
    end

    text.length.times do |i|
      recipe = Recipe.new
      recipe.food_id = food.id
      recipe.text = text[i]
      recipe.save
    end
  end

  def self.check_various(name, food_group_id, amount, text, food)
    name.each do |name|
      food.errors.add(:name, " can't be blank ") if name.empty?
    end
    food_group_id.each do |food_group_id|
      food.errors.add(:food_group_id, " can't be blank ") if food_group_id.empty?
    end
    amount.each do |amount|
      food.errors.add(:amount, " can't be blank ") if amount.empty?
    end
    text.each do |text|
      food.errors.add(:text, " can't be blank ") if text.empty?
    end
  end

  def update_food(food)
    food.update(food_params)
    ingredient = food.ingredients
    ingredient.name.length.times do |i|
      ingredient.food_id = food.id
      ingredient.name = name[i]
      ingredient.food_group_id = food_group_id[i]
      ingredient.amount = amount[i]
      ingredient.update
    end

    text.length.times do |i|
      recipe.food_id = food.id
      recipe.text = text[i]
      recipe.update
    end
  end
end