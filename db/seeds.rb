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
Tag.destroy_all
puts "Database cleared."

# array of tags to seed

tags = ["Remote", "On-site", "Full-time", "Part-time", "Internship", "Freelance", "Contract", "Apprenticeship", "Front-end", "Back-end", "Full-stack", "Ruby", "JavaScript", "Python", "Java", "HTML", "CSS"]

tags.each do |tag|
  Tag.create(name: tag)
end

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

  # add tags to jobs
  Job.last.tags << Tag.all.sample(rand(1..5))
end

1.times do
  Chatroom.create(
    name: "General"
  )
end
