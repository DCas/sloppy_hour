class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :user_location

  def user_location
    @lat_lng ||= cookies[:lat_lng] ? cookies[:lat_lng].split("|") : request.location.coordinates
    geo_result = Geocoder.search(@lat_lng).first
    @city_state ||= geo_result.data["address_components"][2]["long_name"] + ", " + geo_result.data["address_components"][4]["short_name"]
  end

end
