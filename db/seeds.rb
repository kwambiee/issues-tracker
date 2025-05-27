# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_title|
#     MovieGenre.find_or_create_by!(title: genre_title)
#   end

# Create several Projects
# db/seeds.rb
puts "Seeding initial data..."

# Clear existing data (optional - only use in development!)
if Rails.env.development?
  puts "Clearing existing data..."
  Issue.delete_all
  Project.delete_all
#   User.delete_all
  puts "Existing data cleared."
end

# Create sample users
# users = [
#   { email: "admin@example.com", title: "Admin User", role: "admin", password: "password" },
#   { email: "manager@example.com", title: "Project Manager", role: "manager", password: "password" },
#   { email: "developer@example.com", title: "Developer", role: "developer", password: "password" }
# ]

# users.each do |user_attrs|
#   User.find_or_create_by!(email: user_attrs[:email]) do |user|
#     user.assign_attributes(user_attrs)
#     puts "Created user: #{user.email}"
#   end
# end

# Create sample projects
projects = [
  { title: "Website Redesign", description: "Complete overhaul of company website" },
  { title: "Mobile App", description: "New iOS/Android application" },
    { title: "API Development", description: "Develop RESTful API for internal services" },
    { title: "E-commerce Platform", description: "Build a new e-commerce platform from scratch" },
    { title: "Data Migration", description: "Migrate legacy data to new database system" }
]

projects.each do |project_attrs|
  Project.find_or_create_by!(title: project_attrs[:title]) do |project|
    project.assign_attributes(project_attrs)
    puts "Created project: #{project.title}"
  end
end

# Create sample issues
issues = [
  { 
    title: "Fix homepage layout", 
    status: :in_progress,
    priority: :high,
    project: Project.find_by(title: "Website Redesign")
  },
  {
    title: "Implement dark mode",
    status: :new,
    priority: :medium,
    project: Project.find_by(title: "Mobile App")
  },
  {
    title: "API authentication",
    status: :new,
    priority: :high,
    project: Project.find_by(title: "API Development")
  },
  {
    title: "Payment gateway integration",
    status: :new,
    priority: :medium,
    project: Project.find_by(title: "E-commerce Platform")
  },
  {
    title: "Data cleanup",
    status: :closed,
    priority: :low,
    project: Project.find_by(title: "Data Migration")
  }

]

issues.each do |issue_attrs|
  Issue.find_or_create_by!(title: issue_attrs[:title], project: issue_attrs[:project]) do |issue|
    issue.assign_attributes(issue_attrs)
    puts "Created issue: #{issue.title} for #{issue.project.title}"
  end
end

puts "Seeding complete!"