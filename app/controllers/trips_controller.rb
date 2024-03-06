class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end
  def show
    # Retrieve a specific trip
    @trip = Trip.find(params[:id])
    render json: @trip
  end
  def destroy_all
    Trip.destroy_all
    redirect_to root_path
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      content = get_trip_suggestions(@trip.destination, @trip.start_date, @trip.end_date)
      if content.present?
        @trip.update(content: content)
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Trip was successfully created.' }
          format.json { render :show, status: :created, location: @trip }
          format.js
        end
      else
        # Handle error from service or API call
        render json: { error: "Failed to retrieve suggestions" }, status: :unprocessable_entity
      end
    else
      render :new
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
      @trip = Trip.find(params[:id])
      @trip.destroy

      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Trip was successfully deleted.' }
        format.json { head :no_content }
        format.js
      end
    end

    private

    def get_trip_suggestions(destination, start_date, end_date)
      # Load the service account key JSON file.
      service_account_key_file = File.open("/home/kaprans/code/Kaprans22/WiseVoyage/WiseVoyage/app/controllers/potent.json")
      # Define the required scopes.
      scopes = ['https://www.googleapis.com/auth/cloud-platform']

      # Create an authorization object from the service account key file and the scopes.
      authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: service_account_key_file,
        scope: scopes
      )

      # Request an access token.
      authorizer.fetch_access_token!

      # Use the access token in the Authorization header.
      access_token = authorizer.access_token

      # Construct API request using the retrieved access token
      url = ENV['searchAI']
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Bearer #{access_token}"

      body = {
        "instances": [
          { "prompt": "what can i do in #{destination} from #{start_date} to #{end_date}?"}
        ]
      }

      request.body = body.to_json

      response = http.request(request)

      if response.code == '200'
        result = JSON.parse(response.body)
        return result['predictions'][0]['content']
      else
        Rails.logger.error("API request failed with code #{response.code}")
        return nil
      end
    end

    def trip_params
      params.permit(:destination, :start_date, :end_date, :content)
    end
end
