class BookingsController < ApplicationController
  def index
    @bookings = current_user.restaurant.bookings
    @calendar = []
    lunchHour = ['12h00', '12h30', '13h00', '13h30', '14h00']
    dinnerHour = ['19h00', '19h30', '20h00', '20h30', '21h00']
    Date.today.upto(Date.today + 7).each do |date|
      bookingsLunch = Booking.where(restaurant_id: current_user.restaurant.id).where(date: date, hour: lunchHour)
      @calendar << [date, 'lunch', bookingsLunch.inject(0) { |sum, booking| sum + booking.number_of_customers}]

      bookingsDinner = Booking.where(restaurant_id: current_user.restaurant.id).where(date: date, hour: dinnerHour)
      @calendar << [date,  'dinner', bookingsDinner.inject(0) { |sum, booking| sum + booking.number_of_customers}]
   end
 end

  def show
    @bookings = Booking.new
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    # @booking.price = params[:booking][:beginning_date].upto(params[:booking][:ending_date]).size * @booking.boat.price
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
  params.require(:booking).permit(:date, :hour, :customer, :restaurant, :number_of_customer, :content, :source)
end
