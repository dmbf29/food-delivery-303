require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  private

  def build_instance(row)
    Meal.new(
      id: row[:id].to_i,
      name: row[:name],
      price: row[:price].to_i
    )
  end
end












