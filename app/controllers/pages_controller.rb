class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @suggestions = Suggestion.all
    @countries_geojson = File.read(Rails.root.join('app/assets', 'map.geojson'))
  end

  def dashboard
    @user = current_user
    @user_trips = UserTrip.where(user_id: @user.id)
    @trips = Trip.all
  end
end
