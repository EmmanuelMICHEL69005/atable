class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :restaurant_id)}
  end

  def after_sign_in_path_for(current_user)
    bookings_path
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end


