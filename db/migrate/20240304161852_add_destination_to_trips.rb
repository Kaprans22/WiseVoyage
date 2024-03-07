class AddDestinationToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :destination, :string
  end
end
