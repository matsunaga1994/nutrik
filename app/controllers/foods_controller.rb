class FoodsController < ApplicationController

  def index
    @foods = Food.includes(:user)
    if @foods.length >= 5
      @top_five = Food.find(Like.group(:food_id).order("count(food_id) DESC").limit(5).pluck(:food_id))
    end
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

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to root_path
    # マイページ実装後パス変更
  end

  def show
    @food = Food.find(params[:id])
    @ingredients = Ingredient.where(food_id: params[:id])
    @food_group = @ingredients.group(:food_group_id).count
    @recipes = Recipe.where(food_id: params[:id])
    @like = Like.new
  end

  private
  def food_params
    params.require(:food_ingredient_recipe).permit(:title, :cook_time_id, :cost_id, :comment, :serving, amount: [], name: [], food_group_id: [], text: [], images: []).merge(user_id: current_user.id)
  end
end