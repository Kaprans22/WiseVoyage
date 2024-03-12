require 'rest-client'

class TripsController < ApplicationController
  def index
    @trips = current_user.trips
  end

  def calculate_average
    @trip = Trip.find(params[:id])
    cityFrom = params[:city_name]
    json_key_io = StringIO.new(ENV.fetch('GOOGLE_JSON_KEY', nil))
    scopes = ['https://www.googleapis.com/auth/cloud-platform']
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io:,
      scope: scopes
    )
    authorizer.fetch_access_token!
    access_token = authorizer.access_token
    url = ENV.fetch('searchAI', nil)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = "Bearer #{access_token}"

    body = {
      instances: [
        { prompt: "Please calculate the trip cost to #{@trip.destination} from #{cityFrom}
                      if I want to visit: #{@trip.additional_suggestions}" }
      ]
    }
    request.body = body.to_json
    response = http.request(request)

    if response.code == '200'
      result = JSON.parse(response.body)
      # Extract content from the predictions
      content_data = result['predictions'].first['content']
      Rails.logger.error(content_data)
      @trip.update(average_cost: content_data)
    else
      Rails.logger.error("API request failed with code #{response.code} for destination #{@trip.destination}")
    end
    redirect_to trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
    @user_trip = UserTrip.new
    @trip.content = eval(@trip.content)

    # Make a request to the Pixabay API
    response = RestClient.get "https://pixabay.com/api/", {
      params: {
        key: ENV.fetch('PIXABAY_API_KEY', nil),
        q: @trip.destination,
        image_type: 'photo',
        safesearch: true,
        per_page: 5
      }
    }
    result = JSON.parse(response.body)

    @trip.update_attribute(:image_urls, result['hits'].map { |hit| hit['webformatURL'] })

    return unless @trip.additional_suggestions.nil? || @trip.additional_suggestions.empty?

    additional_suggestions = get_additional_suggestions(@trip.destination, @trip.start_date, @trip.end_date, false)
    return unless additional_suggestions[@trip.destination.strip]

    @trip.update_attribute(:additional_suggestions,
                           additional_suggestions[@trip.destination.strip])
  end

  def get_trip_cost(_content, _homeplace)
    destinations = [destinations] unless destinations.is_a?(Array)
    results = {}
    json_key_io = StringIO.new(ENV.fetch('GOOGLE_JSON_KEY', nil))
    scopes = ['https://www.googleapis.com/auth/cloud-platform']
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io:,
      scope: scopes
    )
    destinations.each do |destination|
      authorizer.fetch_access_token!
      access_token = authorizer.access_token
      url = ENV.fetch('searchAI', nil)
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Bearer #{access_token}"

      body = {
        instances: [
          { prompt: "Please describe the country - #{destination} in a few words" }
        ]
      }

      request.body = body.to_json

      response = http.request(request)

      if response.code == '200'
        result = JSON.parse(response.body)
        results[destination] = result['predictions'][0]['content']
      else
        Rails.logger.error("API request failed with code #{response.code} for destination #{destination}")
      end
    end

    results
  end

  def destroy_all
    trips_to_keep = current_user.user_trips.pluck(:trip_id)
    current_user.trips.where.not(id: trips_to_keep).destroy_all
    redirect_to root_path
  end

  def pretty_content(content)
    content.transform_values do |value|
      value.gsub('**', '').gsub("\n", ' ')
    end
  end

  def create
    destinations = trip_params[:destination].split(',').map(&:strip)
    @trips = []
    errors = []

    destinations.each do |destination|
      @trip = current_user.trips.new(trip_params.except(:destination).merge(destination:))
      content = get_trip_suggestions(@trip.destination, @trip.start_date, @trip.end_date, destinations.size > 1)
      if content.present?
        pretty_content = pretty_content(content)
        @trip.content = pretty_content
        if @trip.save
          @trips << @trip
        else
          errors << { destination:, error: @trip.errors.full_messages }
        end
      else
        errors << { destination:, error: "Failed to retrieve suggestions" }
      end
    end

    if errors.empty?
      respond_to do |format|
        if destinations.size > 1
          format.html { redirect_to trips_path, notice: 'Trip(s) were successfully created.' }
          format.json { render json: @trips, status: :created }
        else
          format.html { redirect_to trip_path(@trips.first), notice: 'Trip was successfully created.' }
          format.json { render json: @trips.first, status: :created }
        end
        format.js
      end
    else
      render json: { errors: }, status: :unprocessable_entity
    end
  end

  def update
    @trip = current_user.trips.find(params[:id])
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def delete_specific
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path, notice: 'Trip was successfully deleted.'
  end

  def cancel_suggestion
    @trip = Trip.find(params[:id])
    suggestions = JSON.parse(@trip.additional_suggestions)
    json_key_io = StringIO.new(ENV.fetch('GOOGLE_JSON_KEY', nil))
    scopes = ['https://www.googleapis.com/auth/cloud-platform']
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io:,
      scope: scopes
    )
    authorizer.fetch_access_token!
    access_token = authorizer.access_token
    url = ENV.fetch('searchAI', nil)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = "Bearer #{access_token}"
    date_object = suggestions.find do |obj|
      obj['suggestions'].include?(params[:suggestion]) && obj['date'] == params[:date]
    end

    if date_object
      index = date_object['suggestions'].index(params[:suggestion])
      body =  {
        instances: [
          {
            content: "I'm using you as an API, don't send me any human language. Please suggest a single activity in  #{params[:destination]} on the date:#{params[:dateForSug]} that you havent recommended me yet, without mentioning the date}.
            I'd like to have a single suggestion formatted In a JSON like this:
            activity: 'activity',
            "
          }
        ],
        parameters: {
          candidateCount: 1,
          maxOutputTokens: 1024,
          temperature: 0.9,
          topP: 1
        }
      }
      request.body = body.to_json
      response = http.request(request)
      Rails.logger.error(response.body)
      if response.code == '200'
        response.body.gsub!(/(```|json)/, '')
        result = JSON.parse(response.body)
        @new_suggestion = JSON.parse(result['predictions'][0]['content'])
        date_object['suggestions'][index] = @new_suggestion['activity']
        @suggestion = @new_suggestion['activity']
      else
        Rails.logger.error("API request failed with code #{response.code} for destination #{params[:destination]}")
        @suggestion = params['suggestion']
      end
    end



    @trip.update(additional_suggestions: suggestions.to_json)


    respond_to do |format|
      format.html { redirect_to @trip }
      format.text { render partial: 'trip_suggestion', locals: { suggestion: @suggestion, trip: @trip, date: params[:dateForSug] }, formats: [:html] }
      format.json
    end
  end

  private

  def get_additional_suggestions(destinations, start_date, end_date, _limit_words)
    destinations = [destinations] unless destinations.is_a?(Array)
    results = {}
    require 'stringio'
    json_key_io = StringIO.new(ENV.fetch('GOOGLE_JSON_KEY', nil))
    scopes = ['https://www.googleapis.com/auth/cloud-platform']
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io:,
      scope: scopes
    )
    destinations.each do |destination|
      authorizer.fetch_access_token!
      access_token = authorizer.access_token
      url = ENV.fetch('searchAI', nil)
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Bearer #{access_token}"

      body = {
        instances: [
          { prompt: " I'm using you as an API, don't send me any human language.
            Please suggest activities in #{destination} from #{start_date} to #{end_date}.
            I want to build a daily trip itinerary.
            Between one and three suggestions would be great with some description for each.
            No repitition please.
            I'd like to have an array of suggestions.
            Formatted in JSON with {
            date: 'date',
            suggestions: ['suggestions']
            }
            Reply with just the JSON" }
        ],
        "parameters": {
          "maxOutputTokens": 2048
        }
      }

      request.body = body.to_json

      response = http.request(request)

      if response.code == '200'
        response.body.gsub!(/(```|json)/, '')
        result = JSON.parse(response.body)
        suggestions = result['predictions'][0]['content']
        results[destination] = suggestions
      else
        Rails.logger.error("API request failed with code #{response.code} for destination #{destination}")
      end
    end
    results
  end

  def get_trip_suggestions(destinations, _start_date, _end_date, _limit_words)
    destinations = [destinations] unless destinations.is_a?(Array)
    results = {}
    json_key_io = StringIO.new(ENV.fetch('GOOGLE_JSON_KEY', nil))
    scopes = ['https://www.googleapis.com/auth/cloud-platform']
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io:,
      scope: scopes
    )
    destinations.each do |destination|
      authorizer.fetch_access_token!
      access_token = authorizer.access_token
      url = ENV.fetch('searchAI', nil)
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Bearer #{access_token}"

      body = {
        instances: [
          { prompt: "Please describe the country - #{destination} in a few words" }
        ]
      }

      request.body = body.to_json

      response = http.request(request)

      if response.code == '200'
        result = JSON.parse(response.body)
        results[destination] = result['predictions'][0]['content']

        url = "https://pixabay.com/api/?key=#{ENV.fetch('PIXABAY_API_KEY',
                                                        nil)}&q=#{destination}&image_type=photo&per_page=3"
        puts "Request URL: #{url}"

        response = RestClient.get(url)
        resultPic = JSON.parse(response.body)

        if resultPic['hits'].any?
          photo_url = resultPic['hits'].first['largeImageURL']
          cloudinary_result = Cloudinary::Uploader.upload(photo_url)
          @trip.update(photo_url: cloudinary_result['secure_url'])
        end
      else
        Rails.logger.error("API request failed with code #{response.code} for destination #{destination}")
      end
    end
    results
  end

  def trip_params
    params.permit(:destination, :start_date, :end_date, :photo_url)
  end
end
