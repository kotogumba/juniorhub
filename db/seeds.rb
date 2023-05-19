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
Comment.destroy_all
puts "Comments cleared."
Blog.destroy_all
puts "Blogs cleared."
Category.destroy_all
puts "Categories cleared."

Tag.destroy_all
puts "Tags cleared."

puts "Blog features cleared."

JobResponse.destroy_all
puts "Job responses cleared."
Profile.destroy_all
puts "Profiles cleared."
User.destroy_all
puts "Users cleared."
Message.destroy_all
puts "Messages cleared."
Chatroom.destroy_all
puts "Chatrooms cleared."
JobResponse.destroy_all
puts "Job responses cleared."
Job.destroy_all
puts "Jobs cleared."


puts "Database cleared."

# array of tags to seed

tags = ["Remote", "Apprenticeship", "CSS", "On-site", "JavaScript", "HTML", "Full-time", "Part-time", "Internship", "Freelance", "Java", "Contract", "Front-end", "Back-end", "Ruby", "Full-stack", "Python"]
categories = ["Design", "Lifestyle", "Science", "Security", "Python", "JavaScript", "Job hunt", "Interview preparation", "Hardware", "Programming", "Front-end", "Back-end"]

tags.each do |tag|
  Tag.create(name: tag)
end

categories.each do |category|
  Category.create(name: category)
end

1.times do
  Chatroom.create(
    name: "General"
  )
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
  blog = Blog.create(
    title: Faker::Lorem.sentence,
    user: user
  )

  blog.tags << Tag.all.sample(rand(1..5))
  blog.categories << Category.all.sample(rand(1..5))
  blog.save
end

10.times do
  blog = Blog.create(
    title: Faker::Lorem.sentence,
    user: User.all.sample
  )

  blog.tags << Tag.all.sample(rand(1..5))
  blog.categories << Category.all.sample(rand(1..5))
  blog.save
end

Blog.all.each do |blog|
  10.times do
    post = BlogPost.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      blog: blog
    )
    post.categories << Category.all.sample(rand(1..5))
    post.save

    3.times do
      Comment.create(
        content: Faker::Lorem.paragraph,
        blog_post: post,
        user: User.all.sample
      )
    end
  end
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

# Create 10 jobs
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
