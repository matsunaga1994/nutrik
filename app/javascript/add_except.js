function add(){
  const addIngredient = document.getElementById("add-ingredient-btn");
  const addElement = document.getElementById("ingredient-detail");
  let ingredientText = document.getElementById("ingredient-main");

  addIngredient.addEventListener('click', function(){
    ingredientText.insertAdjacentHTML("beforeend", addElement.outerHTML);
  });

  const addRecipe = document.getElementById("add-recipe-btn");
  const addRecipeElement = document.getElementById("food-recipe");
  let recipeText = document.getElementById("recipe-main");

  addRecipe.addEventListener('click', function(){
    recipeText.insertAdjacentHTML("beforeend", addRecipeElement.outerHTML);
  });
  
  // let remove = document.querySelectorAll(".except-btn");
  // document.on('click', ".except-btn", function(){
  //   console.log("ok")
  // });
};
window.addEventListener('load', add);