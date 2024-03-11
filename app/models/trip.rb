class Trip < ApplicationRecord
  belongs_to :user
  # has_many :daily_schedules
  has_many :user_trips
end
