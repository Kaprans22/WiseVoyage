class UserTripsController < ApplicationController

  # def new
  #   @user_trip = UserTrip.new
  # end

  def create
    @user_trip = UserTrip.new(trip_id: params[:user_trip][:trip_id], user_id: params[:user_trip][:user_id])
    # @user_trip.user = current_user
    if @user_trip.save
      redirect_to dashboard_path, notice: 'Trip was successfully saved.'
    else
      redirect_to dashboard_path, notice: 'Trip was not saved.'
      # CHANGE DASHBOARD PATH OPTION
    end
  end

  def destroy
    @user_trip = UserTrip.find(params[:id])
    @user_trip.destroy
    redirect_to dashboard_path, notice: 'Trip was successfully removed.'
  end

  private

  def user_trip_params
    params.require(:user_trip).permit(:trip_id, :user_id)
  end
end
