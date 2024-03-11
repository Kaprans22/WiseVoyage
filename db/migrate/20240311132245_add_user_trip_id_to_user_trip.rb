class AddUserTripIdToUserTrip < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_trips, :user, foreign_key: true
    add_reference :user_trips, :trip, foreign_key: true
  end
end
