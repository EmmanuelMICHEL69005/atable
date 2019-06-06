# require_relative '../services/lafourchette_scrapper'

class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
    def index
    LafourchetteScrapper.run
    set_bookings
    @customer = Customer.new
    @customer.bookings.build
    @total_customer = total_customers
    @notification = total_notifications
    @origin = {
              'La Fourchette' => "http://i0.wp.com/lewebcestfood.fr/wp-content/uploads/2016/02/La-fourchette.png?fit=300%2C300",
              'Facebook' => "https://img.icons8.com/color/384/facebook.png",
              'Site Internet' => "https://img.icons8.com/ios/384/internet.png",
              'Phone' => "https://img.icons8.com/metro/384/phone.png",
              'Other' => "https://img.icons8.com/ios/384/conference-call-filled.png"
              }

  end
  def set_bookings
    if params[:date]
      date = Date.strptime(params[:date][2..-1], "%y-%m-%d")
      @bookings = current_user.restaurant.bookings.where(date: date)
    else
      @bookings = current_user.restaurant.bookings.where(date: Date.today)
    end
  end

  def notifications
    @bookings = current_user.restaurant.bookings
    render json: {total: total_notifications}.to_json
  end


  def show

  end

  def new
    @booking = Booking.new
    @customer = Customer.new
  end

  def create
    customer = Customer.find_by(email: params[:booking][:email])

    if customer.blank?

      customer = Customer.create!(
        email: params[:booking][:email],
        first_name: params[:booking][:first_name],
        last_name: params[:booking][:last_name],
        phone_number: params[:booking][:phone_number]
      )
    end
    # puts "3"*99
    # puts params
    # puts params[:booking][:date]
    # puts params[:date]
    # puts params[:hour]
    # puts params[:hour].class

    booking = Booking.new(
      date: params[:date],
      number_of_customers: params[:booking][:number_of_people],
      source: 'other',
      restaurant: current_user.restaurant,
      customer: customer,
      hour: params[:hour].gsub(":", "h"),
      content: params[:booking][:comments],
      status: "new"
    )


    if booking.save
      redirect_to bookings_path + '?date='+ params[:date]
    else
      redirect_to bookings_path, alert: "Votre restaurant est plein"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to bookings_path, notice: 'La réservation a été modifiée avec succès.' }

      else
        format.html { render :edit }

      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'La réservation a bien été supprimée.' }
      format.json { head :no_content }
    end
  end

  def edit
     @booking = Booking.find(params[:id])
  end
end

private

def booking_params
  params.require(:booking).permit(:date, :forkid, :hour, :customer, :restaurant, :number_of_customers, :content, :source,
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
  h2130 = []
  h2200 = []
  @bookings.where(date: Date.today).each do |b|
    if b.hour == '12h00' || b.hour == '12:00'
      h1200 << b.number_of_customers
      h1230 << b.number_of_customers
      h1300 << b.number_of_customers
    elsif b.hour == '12h30' || b.hour == '12:30'
      h1230 << b.number_of_customers
      h1300 << b.number_of_customers
      h1330 << b.number_of_customers
    elsif b.hour == '13h00' || b.hour == '13:00'
      h1400 << b.number_of_customers
      h1300 << b.number_of_customers
      h1330 << b.number_of_customers
    elsif b.hour == '13h30' || b.hour == '13:30'
      h1400 << b.number_of_customers
      h1330 << b.number_of_customers
    elsif b.hour == '14h00' || b.hour == '14:00'
      h1400 << b.number_of_customers
    elsif b.hour == '19h00' || b.hour == '19:00'
      h1900 << b.number_of_customers
      h1930 << b.number_of_customers
      h2000 << b.number_of_customers
    elsif b.hour == '19h30' || b.hour == '19:30'
      h1930 << b.number_of_customers
      h2030 << b.number_of_customers
      h2000 << b.number_of_customers
    elsif b.hour == '20h00' || b.hour == '20:00'
      h2100 << b.number_of_customers
      h2030 << b.number_of_customers
      h2000 << b.number_of_customers
    elsif b.hour == '20h30' || b.hour == '20:30'
      h2130 << b.number_of_customers
      h2100 << b.number_of_customers
      h2030 << b.number_of_customers
    elsif b.hour == '21h00' || b.hour == '21:00'
      h2200 << b.number_of_customers
      h2130 << b.number_of_customers
      h2100 << b.number_of_customers
    end
end
return [h1200, h1230, h1300, h1330, h1400, h1900, h1930, h2000, h2030, h2100, h2130, h2200]
end

def total_notifications
  notification = 0
  @bookings.where(date: Date.today).each do |booking|
    if booking.status == "New"
      notification += 1
    end
  end
  return notification
end






