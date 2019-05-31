class CustomersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @customer = Customer.new
    @booking = Booking.new
  end

  def create
    @customer = Customer.new(customer_params)
    raise

  end

  def update
  end

  def destroy
  end

  def edit
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :fourchette_id, :facebook_id, :phone_number, :email,
      bookings_attributes: [:date, :hour, :customer, :restaurant, :number_of_customers, :content, :source])
  end
end
