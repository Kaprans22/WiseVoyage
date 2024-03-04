class CreateUserTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :user_trips do |t|

      t.timestamps
    end
  end
end
