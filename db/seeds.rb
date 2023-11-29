# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'

Project.destroy_all
Task.destroy_all
User.destroy_all

user1 = User.create!(email: 'christine.onsi@gmail.com', password: 'chris123')
user2 = User.create!(email: 'test@test2.com', password: '123ed23')
user3 = User.create!(email: 'test@test1.com', password: '12ss23')
felipe = User.create!(email: 'feliperazzini@hotmail.com', password: 'felipe')


projects = [
  project_1 = { name: "Task management application", description: "Build task managment application", start_date: "13-11-2023", end_date: "30-1-2024", status: "In progress", user_id: user1.id },
  project_2 = { name: "Resturant website", description: "Build resturant website", start_date: "14-7-2023", end_date: "25-10-2023", status: "Completed", user_id: user2.id },
  project_3 = { name: "E-commerce website", description: "Build E-commerce website", start_date: "14-12-2023", end_date: "14-2-2024", status: "Pending", user_id: user3.id },
  project_4 = { name: "Ruby Project", description: "Build task managment application", start_date: "10-10-2023", end_date: "30-1-2024", status: "In progress", user_id: user1.id },
  project_5 = { name: "REACT Project", description: "Build resturant website", start_date: "12-1-2023", end_date: "21-3-2023", status: "Completed", user_id: user2.id },
  project_6 = { name: "Stimulus Project", description: "Build E-commerce website", start_date: "2-12-2023", end_date: "2-1-2024", status: "Pending", user_id: user3.id },
  project_7 = { name: "Vue Project", description: "Build task managment application", start_date: "18-11-2023", end_date: "19-12-2023", status: "In progress", user_id: user1.id },
  project_8 = { name: "Javascript Project", description: "Build task managment application", start_date: "27-11-2023", end_date: "27-1-2024", status: "In progress", user_id: user1.id },
  project_9 = { name: "CSS Project", description: "Build task managment application", start_date: "10-8-2023", end_date: "14-12-2023", status: "In progress", user_id: user1.id },
  project_10 = { name: "HTML Project", description: "Build task managment application", start_date: "4-7-2023", end_date: "30-11-2023", status: "In progress", user_id: user1.id }
]

projects.each do |attribute|
  project = Project.create!(attribute)
  puts "create #{project.name}"
end
puts "Finished projects seeding!"

task_1 = { title: "Design figma", priority: "Low", status: "Pending", start:"13-10-2023", end:"30-10-2023",user_id:user2.id}
task_2 = { title: "Build frontend code", priority: "Medium", status: "In progress", start:"1-11-2023", end:"25-11-2023",user_id:user3.id}
task_3 = { title: "Build Backend code", priority: "High", status: "Completed", start:"13-10-2023", end:"30-10-2023",user_id:user3.id}
task_4 = { title: "check functionality", priority: "High", status: "In progress", start:"1-12-2023", end:"30-12-2023",user_id:user1.id}
task_5 = { title: "Meeting with Product Team", priority: "High", status: "In progress", start:"29-11-2023", end:"30-11-2023",user_id:user3.id}
task_6 = { title: "Daily Sprint", priority: "Medium", status: "In progress", start:"29-11-2023", end:"30-11-2023",user_id:user1.id}

[task_1, task_2, task_3, task_4, task_5, task_6].each do |attribute|
  task= Task.create!(attribute)
  puts "create #{task.title}"
end
puts "Finished tasks seeding!"
