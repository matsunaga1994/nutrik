class FoodsController < ApplicationController

  def index
    @foods = Food.includes(:user)
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

  def show
    @food = Food.find(params[:id])
    @ingredients = Ingredient.where(food_id: params[:id])
  end

  private
  def food_params
    params.require(:food_ingredient_recipe).permit(:title, :image, :cook_time_id, :cost_id, :comment, :food_group_id, name: [], food_group_id: [], text: []).merge(user_id: current_user.id)
  end
end