require_relative'../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # ask the repo for customers
    customers = @customer_repository.all
    # pass the customers to the view
    @customers_view.display(customers)
  end

  def add
    # ask user for name = name
    name = @customers_view.ask_for_('name')
    # ask user for price = price
    address = @customers_view.ask_for_('address')
    customer = Customer.new(name: name, address: address)
    # tell repo to save it
    @customer_repository.add(customer)
  end
end
