class BookingsController < ApplicationController
  def index
    @bookings = current_user.restaurant.bookings
    @customer = Customer.new
    @customer.bookings.build
    @calendar = []
    lunchHour = ['12h00', '12h30', '13h00', '13h30', '14h00']
    dinnerHour = ['19h00', '19h30', '20h00', '20h30', '21h00']
    Date.today.upto(Date.today + 7).each do |date|
      bookingsLunch = Booking.where(restaurant_id: current_user.restaurant.id).where(date: date, hour: lunchHour)
      bookingsDinner = Booking.where(restaurant_id: current_user.restaurant.id).where(date: date, hour: dinnerHour)
      @calendar << [date, bookingsLunch, bookingsDinner]
   end

 end



  def show

  end

  def new
    @booking = Booking.new
    @customer = Customer.new
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    # @booking.price = params[:booking][:beginning_date].upto(params[:booking][:ending_date]).size * @booking.boat.price
    raise
    @booking.save!
    redirect_to bookings_path
  end

  def update
  end

  def destroy
  end

  def edit
  end
end

private

def booking_params
  params.require(:booking).permit(:date, :hour, :customer, :restaurant, :number_of_customer, :content, :source,
    customers_attributes: [:id, :last_name, :phone_number, :email, :first_name])
end







