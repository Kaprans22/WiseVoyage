class AddContentToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :content, :string
  end
end
