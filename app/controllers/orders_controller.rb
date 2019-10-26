require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repo, employee_repo, customer_repo, order_repo)
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @order_repository = order_repo
    @orders_view = OrdersView.new
  end

  def list_undelivered_orders
    # get the undelivered orders from repo
    orders = @order_repository.undelivered_orders
    # send those to the view
    @orders_view.display(orders)
  end

  def add
    # display the meals
    MealsController.new(@meal_repository).list
    # ask user for meal id
    meal_id = @orders_view.ask_for_('meal ID').to_i
    # find the instance with the id
    meal = @meal_repository.find(meal_id)

    CustomersController.new(@customer_repository).list
    # ask user for customer id
    customer_id = @orders_view.ask_for_('customer ID').to_i
    # find the instance with the id
    customer = @customer_repository.find(customer_id)

    employees = @employee_repository.delivery_guys
    @orders_view.display_employees(employees)
    employee_id = @orders_view.ask_for_('employee ID').to_i
    employee = @employee_repository.find(employee_id)

    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    # get the orders from repo
    orders = @order_repository.undelivered_orders
    orders = orders.select { |order| order.employee == employee }
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    # show the undelivered
    list_my_orders(employee)
    order_id = @orders_view.ask_for_('order ID').to_i
    # find in repo
    # deliver!
    @order_repository.mark_as_delivered(order_id)
  end
end







