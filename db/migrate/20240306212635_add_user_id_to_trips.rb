class AddUserIdToTrips < ActiveRecord::Migration[7.1]
  def change
    add_reference :trips, :user, null: false, foreign_key: true
  end
end
