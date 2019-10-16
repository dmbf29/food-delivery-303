require_relative 'base_view'

class CustomersView < BaseView
  def display(customers) # array of instances
    if customers.any?
      customers.each do |customer|
        puts "#{customer.id} | #{customer.name} - #{customer.address}"
      end
    else
      puts "No customers yet :("
    end
  end
end

