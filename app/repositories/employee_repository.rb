require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  # @employess = []

  def find_by_username(username) # returns instance or nil
    @elements.find { |employee| employee.username == username }
  end

  def delivery_guys
    @elements.reject { |employee| employee.manager? }
  end

  private

  def build_instance(row)
    Employee.new(
      id: row[:id].to_i,
      username: row[:username],
      password: row[:password],
      role: row[:role]
    )
  end
end
