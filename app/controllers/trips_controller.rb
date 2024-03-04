class TripsController < ApplicationController
  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    # Retrieve a specific trip
    @trip = Trip.find(params[:id])

    # Get data from API
    url = ENV['searchAI']
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path)
    request['Content-Type'] = 'application/json'

    body = {
      "instances": [
        { "prompt": "what can i do in #{@trip.destination} from #{@trip.start_date} to #{@trip.end_date}?"}
      ]
    }

    request.body = body.to_json

    response = http.request(request)

    if response.code == '200'
      result = JSON.parse(response.body)
      # Add the result to the trip data
      @trip_data = @trip.attributes
      @trip_data[:api_data] = result
    else
      # Handle the error here
      @trip_data = @trip
    end

    render json: @trip_data
  end

  def show
    # Retrieve a specific trip
    @trip = Trip.find(params[:id])
    render json: @trip
  end

  def create
    # Create a new trip
    require 'net/http'
    @trip = Trip.new(trip_params)
    if @trip.save
      # Get data from API
      url = ENV['searchAI']
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = 'application/json'

      body = {
        "instances": [
          { "prompt": "what can i do in #{@trip.destination} from #{@trip.start_date} to #{@trip.end_date}?"}
        ]
      }

      request.body = body.to_json

      response = http.request(request)

      if response.code == '200'
        result = JSON.parse(response.body)
        # Add the result to the trip data
        @trip_data = @trip.attributes
        @trip_data[:api_data] = result
        render json: @trip_data, status: :created
      else
        # Handle the error here
        render json: @trip.errors, status: :unprocessable_entity
      end
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def update
    # Update an existing trip
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # Delete a trip
    @trip = Trip.find(params[:id])
    @trip.destroy
    head :no_content
  end

  private

  def trip_params
    params.permit(:destination, :start_date, :end_date)
  end
end
