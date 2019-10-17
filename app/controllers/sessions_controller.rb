require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    # ask employee for username = username
    username = @view.ask_for_('username')
    # ask employee for password = password
    password = @view.ask_for_('password')
    # find the employee by the username
    employee = @employee_repository.find_by_username(username)
    # check the password with the one given
    if employee && employee.password == password
      @view.welcome_message(employee)
      # start the sesssion
      # show the menu
      return employee
    else
      @view.wrong_credentials
      # hey thats wrong
      # ask the employee again
      login
    end
  end
end
