class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @current_employee = @sessions_controller.login
      while @current_employee
        # if @current_employee.role == "manager"
        if @current_employee.manager?
          print_manager_menu
          manager_choice = gets.chomp.to_i
          print `clear`
          route_manager_action(manager_choice)
        else
          print_rider_menu
          rider_choice = gets.chomp.to_i
          print `clear`
          route_rider_action(rider_choice)
        end
      end
    end
  end

  private

  def print_manager_menu
    puts "----------------------------"
    puts "------- MANAGER MENU -------"
    puts "----------------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def print_rider_menu
    puts "--------------------------"
    puts "------- RIDER MENU -------"
    puts "--------------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def route_rider_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    logout!
    @running = false
  end

  def logout!
    @current_employee = nil
  end
end
