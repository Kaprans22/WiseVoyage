class AddAverageCostToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :average_cost, :string
  end
end
