class ReviewsController < ApplicationController
  def index
    @reviews = Customer.find(params[:id]).reviews
  end


  def show
     @reviews = Customer.find(params[:id])
  end


  def new
    @review = Review.new
  end


  def create
    @customer = Customer.find(params[:customer_id])
    @review = Review.new(review_params)
    @review.customer = @customer
    @review.save!
    redirect_to edit_customer_path(Customer.find(params[:customer_id]))

  end

  def update
  end

  def destroy
    end


  def edit
  end

private

  def review_params
    params.require(:review).permit(:date, :user_id, :nature, :content, :customer)
  end
end
