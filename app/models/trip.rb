class Trip < ApplicationRecord
  has_many :daily_schedules
  has_many :user_trips
  has_many :users, through: :user_trips
end
