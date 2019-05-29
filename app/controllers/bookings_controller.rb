class BookingsController < ApplicationController
  def index
    @bookings = current_user.restaurant.bookings
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
