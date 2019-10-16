require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
  private

  def build_instance(row)
    Customer.new(
      id: row[:id].to_i,
      name: row[:name],
      address: row[:address]
    )
  end
end
