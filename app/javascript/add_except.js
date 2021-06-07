function add() {
  const addIngredient = document.getElementById("add-ingredient-btn");
  const addElement = document.getElementById("ingredient-main-inner");
  const foodGroup = document.getElementById("food-group");
  let ingredientText = document.getElementById("ingredient-main");

  addIngredient.addEventListener("click", function () {
    ingredientText.insertAdjacentHTML("beforeend", addElement.outerHTML);
  });

  const addRecipe = document.getElementById("add-recipe-btn");
  const addRecipeElement = document.getElementById("food-recipe");
  let recipeText = document.getElementById("recipe-main");

  addRecipe.addEventListener("click", function () {
    recipeText.insertAdjacentHTML("beforeend", addRecipeElement.outerHTML);
  });

  const remove = document.querySelectorAll(".except-btn");
  // const parent = remove.parentNode.parentNode;
  remove.addEventListener('click', function(e){
    console.log(e)
  });
}
window.addEventListener("load", add);
