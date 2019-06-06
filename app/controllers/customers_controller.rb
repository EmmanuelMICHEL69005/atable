class CustomersController < ApplicationController
  def index
    @bookings = current_user.restaurant.bookings
    @restaurant = current_user.restaurant.name
    @liste = []
    @bookings.each do |booking|
      @liste << booking.customer
    end
    @customers = @liste.uniq
  end


  def show
     @customer = Customer.find(params[:id])
  end


  def new
    @customer = Customer.new
    @booking = Booking.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    @review = Review.new(review_params)

  end

  def update
  end

  def destroy
    @customers.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def edit
    @customer = Customer.find(params[:id])
    @bookings = @customer.bookings.all
    @reviews = Customer.find(params[:id]).reviews
    @review = Review.new
    @user = current_user
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :fourchette_id, :facebook_id, :phone_number, :email,
      bookings_attributes: [:date, :hour, :customer, :restaurant, :number_of_customers, :content, :source])
  end
  def review_params
    params.require(:review).permit(:date, :user_id, :nature, :content, :customer)
  end
end
