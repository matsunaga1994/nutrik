class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = FoodIngredientRecipe.new
  end

  def create
    @food = FoodIngredientRecipe.new(food_params)
    if @food.valid?
      @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def food_params
    params.require(:food_ingredient_recipe).permit(:title, :image, :cook_time_id, :cost_id, :comment, :name, :food_group_id, :text).merge(user_id: current_user.id)
  end

end