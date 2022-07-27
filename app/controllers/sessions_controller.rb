require_relative "../views/sessions_view.rb"

class SessionsController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # Ask user for username
    username = @sessions_view.ask_for(:username)
    # Ask user for password
    password = @sessions_view.ask_for(:password)
    # Check the credentials (username + password)
    current_employee = @employee_repository.find_by_username(username)
    if current_employee &&  current_employee.password == password
    # if credential buena -> send message welcome
      @sessions_view.sucessfully_signed_in
      return current_employee
    # if not -> wrong credentials
    else
      @sessions_view.wrong_credentials
      login
    end
  end

end
