class AddPhotoUrlToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :photo_url, :string
  end
end
