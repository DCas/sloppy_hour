class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :user_location

  def user_location
    @user_location = Location.new(IPLocationStrategy.new(request))
    @lat_lng ||= @user_location.coordinates
  end

  private

  def set_location
    cookies[:lat_lng].nil? ? @user_location.coordinates : cookies[:lat_lng].split("|")
  end

end