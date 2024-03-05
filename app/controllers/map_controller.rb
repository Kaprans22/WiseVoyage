class MapController < ApplicationController
  def index
    @countries_geojson = File.read(Rails.root.join('app/assets', 'map.geojson'))
  end
end
