# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

# clear database
puts "Clearing database..."
JobResponse.destroy_all
Profile.destroy_all
User.destroy_all
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

User.all.each do |user|
  profile = user.build_profile(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip_code: Faker::Address.zip_code,
    country: Faker::Address.country,
    linkedin_url: Faker::Internet.url,
    github_url: Faker::Internet.url,
    personal_website_url: Faker::Internet.url,
    resume_url: Faker::Internet.url,
    other_url: Faker::Internet.url,
    bio: Faker::Lorem.paragraph,
    education: Faker::Lorem.paragraph,
    experience: Faker::Lorem.paragraph,
    skills: Faker::Lorem.paragraph
  )

  # https://loremflickr.com/320/240/avatar
  # add avatar to profile
  file = URI.open("https://source.unsplash.com/random/?portrait")
  profile.avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
  profile.save
end

# create jobs
20.times do
  job = Job.create(
    title: Faker::Job.title,
    content: Faker::Lorem.paragraph,
    location: Faker::Address.city,
    user_id: User.all.sample.id,
    summary: Faker::Lorem.paragraph,
    salary: Faker::Number.number(digits: 5),
    company_name: Faker::Company.name
  )

  # add tags to jobs
  Job.last.tags << Tag.all.sample(rand(1..5))
  file = URI.open("https://loremflickr.com/320/240/logo")
  job.image.attach(io: file, filename: "nes.png", content_type: "image/png")
  job.save
end

1.times do
  Chatroom.create(
    name: "General"
  )
end
