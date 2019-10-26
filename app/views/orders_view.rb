require_relative 'base_view'

class OrdersView < BaseView
  def display(orders) # array of instances
    if orders.any?
      orders.each do |order|
        puts "#{order.id}.) #{order.customer.name}, Employee: #{order.employee.username}, Meal: #{order.meal.name}"
      end
    else
      puts "No orders yet :("
    end
  end

  def display_employees(employees)
    employees.each do |employee|
      puts "#{employee.id} - #{employee.username}"
    end
  end
end
