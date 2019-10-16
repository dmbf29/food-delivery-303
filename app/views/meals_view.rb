require_relative 'base_view'

class MealsView < BaseView
  def display(meals) # array of instances
    if meals.any?
      meals.each do |meal|
        puts "#{meal.id} | #{meal.name} ($#{meal.price})"
      end
    else
      puts "No meals yet :("
    end
  end
end
