# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed data for users

User.destroy_all
Trip.destroy_all
DailySchedule.destroy_all

user1 = User.create!(
  email: 'john.doe@example.com',
  password: 'password123',
  nickname: 'Johhan'
)

user2 = User.create!(
  email: 'jim.lahey@trailer.com',
  password: 'password456',
  nickname: 'Jimbo'
)

user3 = User.create!(
  email: 'alice.smith@example.com',
  password: 'password789',
  nickname: 'Alice'
)

# Seed data for trips
trip1 = Trip.create!(
  flights: 123.45,
  text_suggestion: 'A trip to Paris',
  location: 'Paris, France',
  preferences: 'None',
  start_date: Date.today,
  end_date: Date.today + 7
)

trip2 = Trip.create!(
  flights: 234.56,
  text_suggestion: 'A trip to London',
  location: 'London, UK',
  preferences: 'None',
  start_date: Date.today + 14,
  end_date: Date.today + 21
)

# Seed data for daily_schedules
schedule1 = DailySchedule.create!(
  date: Date.today,
  plan: 'Visit Eiffel Tower and Louvre Museum',
  trip_id: 1
)

schedule2 = DailySchedule.create!(
  date: Date.today + 1,
  plan: 'Explore the Montmartre district',
  trip_id: 1
)

schedule3 = DailySchedule.create!(
  date: Date.today + 2,
  plan: 'Take a Seine river cruise',
  trip_id: 1
)

schedule4 = DailySchedule.create!(
  date: Date.today + 14,
  plan: 'Visit the British Museum',
  trip_id: 2
)

schedule5 = DailySchedule.create!(
  date: Date.today + 15,
  plan: 'Explore the Tower of London',
  trip_id: 2
)

schedule6 = DailySchedule.create!(
  date: Date.today + 16,
  plan: 'Take a ride on the London Eye',
  trip_id: 2
)

# Seed data for user_trips
trip1 = UserTrip.create!(
  user_id: 1,
  trip_id: 1
)

trip2 = UserTrip.create!(
  user_id: 2,
  trip_id: 1
)

trip3 = UserTrip.create!(
  user_id: 3,
  trip_id: 2
)

trip4 = UserTrip.create!(
  user_id: 1,
  trip_id: 2
)

trip5 = UserTrip.create!(
  user_id: 2,
  trip_id: 2
)

trip6 = UserTrip.create!(
  user_id: 3,
  trip_id: 1
)
