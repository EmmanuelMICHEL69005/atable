class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @bookings = current_user.restaurant.bookings
    @customer = Customer.new
    @customer.bookings.build
    @total_customer = total_customers
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
    # binding.pry

    customer = Customer.find_by(email: params[:booking][:email])

    if customer.blank?
      # customer = Customer.create(email: ?)
      customer = Customer.create!(
        email: params[:booking][:email],
        first_name: params[:booking][:first_name],
        last_name: params[:booking][:last_name],
        phone_number: params[:booking][:phone_number]
      )
    end
    puts "3"*99
    puts params
    puts params[:booking][:date]
    puts params[:date]
    puts params[:hour]
    puts params[:hour].class

    Booking.create!(
      date: params[:date],
      number_of_customers: params[:booking][:number_of_people],
      source: 'other',
      restaurant: current_user.restaurant,
      customer: customer,
      hour: params[:hour].tr(":", "h"),
      content: params[:booking][:comments]
    )

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

def total_customers
  h1200 = []
  h1230 = []
  h1300 = []
  h1330 = []
  h1400 = []
  h1900 = []
  h1930 = []
  h2000 = []
  h2030 = []
  h2100 = []
  @bookings.where(date: Date.today).each do |b|
    if b.hour == '12h00'
      h1200 << b.number_of_customers
      h1230 << b.number_of_customers
      h1300 << b.number_of_customers
    elsif b.hour == '12h30'
      h1230 << b.number_of_customers
      h1300 << b.number_of_customers
      h1330 << b.number_of_customers
    elsif b.hour == '13h00'
      h1400 << b.number_of_customers
      h1300 << b.number_of_customers
      h1330 << b.number_of_customers
    elsif b.hour == '13h30'
      h1400 << b.number_of_customers
      h1330 << b.number_of_customers
    elsif b.hour == '14h00'
      h1400 << b.number_of_customers
    elsif b.hour == '19h00'
      h1900 << b.number_of_customers
      h1930 << b.number_of_customers
      h2000 << b.number_of_customers
    elsif b.hour == '19h30'
      h1930 << b.number_of_customers
      h2030 << b.number_of_customers
      h2000 << b.number_of_customers
    elsif b.hour == '20h00'
      h2100 << b.number_of_customers
      h2030 << b.number_of_customers
      h2000 << b.number_of_customers
    elsif b.hour == '20h30'
      h2100 << b.number_of_customers
      h2030 << b.number_of_customers
    elsif b.hour == '21h00'
      h2100 << b.number_of_customers
    end
end
return [h1200, h1230, h1300, h1330, h1400, h1900, h1930, h2000, h2030, h2100]
end







