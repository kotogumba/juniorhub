# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


# clear database
puts "Clearing database..."
User.destroy_all
Profile.destroy_all
Message.destroy_all
Chatroom.destroy_all
JobResponse.destroy_all
Job.destroy_all
puts "Database cleared."

# Create 10 users
10.times do
  User.create!(
    nickname: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    admin: false
  )
end

# create jobs
20.times do
  Job.create(
    title: Faker::Job.title,
    content: Faker::Lorem.paragraph,
    location: Faker::Address.city,
    user_id: User.all.sample.id
  )
end

1.times do
  Chatroom.create(
    name: "General"
  )
end
