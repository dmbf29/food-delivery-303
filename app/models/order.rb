class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer
  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @meal = attributes[:meal] # INSTANCE
    @employee = attributes[:employee] # INSTANCE
    @customer = attributes[:customer] # INSTANCE
    @delivered = attributes[:delivered] || false # boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
  end

  def build_row
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end
end
