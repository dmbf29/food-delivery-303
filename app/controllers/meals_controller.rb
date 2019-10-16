require_relative'../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # ask the repo for meals
    meals = @meal_repository.all
    # pass the meals to the view
    @meals_view.display(meals)
  end

  def add
    # ask user for name = name
    name = @meals_view.ask_for_('name')
    # ask user for price = price
    price = @meals_view.ask_for_('price').to_i
    meal = Meal.new(name: name, price: price)
    # tell repo to save it
    @meal_repository.add(meal)
  end
end
