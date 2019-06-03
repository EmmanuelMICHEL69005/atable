class EmbedsController < ApplicationController
  layout 'embed'

  def new
  end

  def create
    @customer = Customer.create(
      first_name: params[:booking][:first_name],
      last_name: params[:booking][:last_name],
      email: params[:booking][:email],
      phone_number: params[:booking][:phone_number]
    )

    Booking.create(
      date: params[:booking][:booking_date],
      hour: params[:booking][:booking_hour],
      number_of_customers: params[:booking][:number_of_people],
      content: params[:booking][:comments],
      restaurant_id: '25',
      customer: @customer,
      source: 'iframe'
    )
  end
end
