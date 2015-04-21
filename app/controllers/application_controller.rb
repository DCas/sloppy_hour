class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :user_location

  def user_location
    @lat_lng ||= set_location
  end

  private

  def set_location
    cookies[:lat_lng].nil? ? request.location.coordinates : cookies[:lat_lng].split("|")
  end

end
