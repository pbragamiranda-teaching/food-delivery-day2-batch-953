require_relative "../views/customer_view"

class CustomersController

  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    # grab customers from repo
    customers = @customer_repository.all
    # display to the user
    @customer_view.display_customers(customers)
  end

  def add
    # Ask name
    name = @customer_view.ask_for("name")
    # Ask address
    address = @customer_view.ask_for("address")
    # Create Meal
    customer = Customer.new(name: name, address: address)
    # Give to Repo
    @customer_repository.create(customer)
  end
end
