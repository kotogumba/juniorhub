# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# array of tags to seed

tags = ["Remote / on-site", "Full-time", "Part-time", "Internship", "Freelance", "Contract", "Apprenticeship", "Volunteer", "Full-time", "Part-time",
  "Front-end", "Back-end", "Full-stack", "Mobile", "DevOps", "Data", "Design", "Product", "Marketing", "Sales", "Finance", "HR", "Legal", "Other",
  "Ruby", "Ruby on Rails", "JavaScript", "React", "Angular", "Vue", "Node.js", "Python", "Django", "Flask", "Java", "Spring", "Android", "iOS", "Swift",
  "Kotlin", "C#", ".NET", "PHP", "Laravel", "Symfony", "WordPress", "Go", "Elixir", "Rust", "Scala", "Haskell", "Clojure", "Erlang", "C++", "C", "C",
  "Objective-C", "Perl", "R", "SQL", "MySQL", "PostgreSQL", "MongoDB", "SQLite", "Redis", "Elasticsearch", "Docker", "Kubernetes", "AWS", "GCP", "Azure",
  "Heroku", "Firebase", "Linux", "macOS", "Windows", "Bash", "Zsh", "Git", "GitHub", "GitLab", "Bitbucket", "Agile", "Scrum", "Kanban", "Lean", "DevOps",
  "SaaS", "PaaS", "IaaS", "Fintech", "Edtech", "Healthtech", "Adtech", "E-commerce", "Social media", "Gaming", "Travel", "Food", "Music", "Fashion",
  "Beauty", "Sports", "Education", "Transportation", "Energy", "Real estate", "Finance", "Insurance", "Legal", "Healthcare", "Pharma", "Biotech", "A.I.",
  "Machine learning", "Deep learning", "Computer vision", "Natural language processing", "Robotics", "Blockchain", "Cryptocurrency", "IoT", "AR/VR",
  "Quantum computing", "Cybersecurity", "Big data", "Data science", "Data engineering", "Data analytics", "UX", "UI", "Graphic design", "Product design",
  "Industrial design", "Interaction design", "Motion design", "Visual design", "User research", "Content strategy", "Copywriting", "SEO", "SEM", "SMM",
  "SME", "PR", "Email marketing", "Inbound marketing", "Outbound marketing", "Growth hacking", "Product management", "Business development", "Sales",
  "Account management", "Customer success", "Customer support", "Finance", "Accounting", "Tax", "Audit", "HR", "Recruiting", "Talent management", "Training",
  "Compensation", "Benefits", "Legal", "Corporate law", "Real estate law", "Tax law", "Criminal law", "Family law"]

tags.each do |tag|
  Tag.create(name: tag)
end

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
