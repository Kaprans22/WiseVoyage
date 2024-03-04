class CreateDailySchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_schedules do |t|

      t.timestamps
    end
  end
end
