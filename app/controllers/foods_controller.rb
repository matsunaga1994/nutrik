class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]

  def index
    @foods = Food.includes(:user).order("created_at DESC")
    @top_five = Food.find(Like.group(:food_id).order("count(food_id) DESC").limit(5).pluck(:food_id))
  end

  def new
    @food = FoodIngredientRecipe.new
  end

  def create
    names = params[:names]
    food_group_ids = params[:food_group_ids]
    amounts = params[:amounts]
    texts = params[:texts]
    @food = FoodIngredientRecipe.new(food_params)

    @food.valid?
    FoodIngredientRecipe.check_various(names, food_group_ids, amounts, texts, @food)

    if @food.errors.blank?
      @food.save(names, food_group_ids, amounts, texts)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to controller: 'users', action: 'show', id: current_user.id
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    # food = Food.find(params[:id])
    # name = params[:name]
    # food_group_id = params[:food_group_id]
    # amount = params[:amount]
    # text = params[:text]

    # food.valid?
    # FoodIngredientRecipe.check_various(name, food_group_id, amount, text, food)

    # if food.errors.blank?
    #   food.update_food(food)
    #   redirect_to controller: 'users', action: 'show', id: current_user.id
    # else
    #   render :edit
    # end
  end

  def show
    @food = Food.find(params[:id])
    @ingredients = Ingredient.where(food_id: params[:id])
    @food_group = @ingredients.group(:food_group_id).count
    @recipes = Recipe.where(food_id: params[:id])
    @like = Like.new
  end

  def search
    @foods = Food.search(params[:keyword])
  end

  private
  def food_params
    params.require(:food_ingredient_recipe).permit(:title, :cook_time_id, :cost_id, :comment, :serving, images: []).merge(user_id: current_user.id)
  end
end