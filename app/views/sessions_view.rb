require_relative 'base_view'

class SessionsView < BaseView
  def wrong_credentials
    puts "Sorry wrong credentials. Try again."
  end

  def welcome_message(employee)
    puts "Welcome #{employee.username}!"
  end
end
