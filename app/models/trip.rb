class Trip < ApplicationRecord
  belongs_to :user
  serialize :image_urls, JSON
  # has_many :daily_schedules
  has_many :user_trips, dependent: :destroy
end
