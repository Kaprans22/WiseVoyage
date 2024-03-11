class AddImageUrlsToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :image_urls, :text
  end
end
