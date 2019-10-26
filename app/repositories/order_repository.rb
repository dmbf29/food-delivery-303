require_relative 'base_repository'
require_relative '../models/order'

class OrderRepository < BaseRepository
  def initialize(csv_file_path, meal_repo, customer_repo, employee_repo)
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    super(csv_file_path) # this calls the base intialize
  end

  def undelivered_orders
    @elements.reject do |order|
      order.delivered?
    end
  end

  def mark_as_delivered(id)
    order = find(id)
    order.deliver!
    save_csv
  end

  def build_instance(row)
    Order.new(
      id: row[:id].to_i,
      delivered: row[:delivered] == 'true',
      meal: @meal_repository.find(row[:meal_id].to_i),
      customer: @customer_repository.find(row[:customer_id].to_i),
      employee: @employee_repository.find(row[:employee_id].to_i)
    )
  end
end
