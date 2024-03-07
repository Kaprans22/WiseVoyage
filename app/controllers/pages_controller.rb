class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @countries_geojson = File.read(Rails.root.join('app/assets', 'map.geojson'))
    @suggestions = Suggestion.all
    @suggestions_asia = Suggestion.where(region: "Asia")
    @suggestions_europe = Suggestion.where(region: "Europe")
    @suggestions_latin_america = Suggestion.where(region: "Latin America")
    @countries_geojson = File.read(Rails.root.join('app/assets', 'map.geojson'))
  end

  def dashboard
    @user = current_user
    @user_trips = UserTrip.where(user_id: @user.id)
    @trips = Trip.all
  end
end
