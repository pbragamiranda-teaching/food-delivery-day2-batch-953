require_relative "../views/meal_view"

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    # grab meals from repo
    meals = @meal_repository.all
    # display to the user
    @meal_view.display_meals(meals)
  end

  def add
    # Ask name
    name = @meal_view.ask_for("name")
    # Ask price
    price = @meal_view.ask_for("price")
    # Create Meal
    meal = Meal.new(name: name, price: price.to_i)
    # Give to Repo
    @meal_repository.create(meal)
  end
end
