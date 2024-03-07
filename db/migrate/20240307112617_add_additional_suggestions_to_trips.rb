class AddAdditionalSuggestionsToTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :additional_suggestions, :text
  end
end
