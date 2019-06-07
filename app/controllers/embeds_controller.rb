class EmbedsController < ApplicationController
  layout 'embed'
  skip_before_action :authenticate_user!

  def new
  end

  def create
    if customer.blank?
      @customer = Customer.create(
        first_name: params[:booking][:first_name],
        last_name: params[:booking][:last_name],
        email: params[:booking][:email],
        phone_number: params[:booking][:phone_number]
      )
    end

    @book = Booking.create(
      date: params[:booking][:date],
      hour: params[:booking][:hour],
      number_of_customers: params[:booking][:number_of_people],
      content: params[:booking][:comments],
      restaurant: Restaurant.last,
      customer: @customer,
      status: 'New',
      source: 'Site Internet'
    )
  end

  private

  def customer
    @customer = Customer.find_by(email: params[:booking][:email])
  end
end
