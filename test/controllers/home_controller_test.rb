require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def index
    @suggestions = Suggestion.all
    @countries_geojson = File.read(Rails.root.join('app/assets', 'map.geojson'))
  end
end
