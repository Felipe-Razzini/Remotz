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
Alert.destroy_all

christine = User.create!(email: 'christine.onsi@gmail.com', password: 'chris123', username: 'Christine')
tom = User.create!(email: 'test@test1.com', password: '12ss23', username: 'Tom')
felipe = User.create!(email: 'feliperazzini@hotmail.com', password: 'felipe', username: 'Felipe')

projects = [
  project_1 = { name: "Task management application", description: "Build task managment application", start_date: "13-11-2023", end_date: "30-1-2024", status: "In progress", user_id: felipe.id },
  project_2 = { name: "Resturant website", description: "Build resturant website", start_date: "14-7-2023", end_date: "25-10-2023", status: "Completed", user_id: christine.id },
  project_3 = { name: "E-commerce website", description: "Build E-commerce website", start_date: "14-12-2023", end_date: "14-2-2024", status: "Delayed", user_id: tom.id },
  project_4 = { name: "Ruby Project", description: "Build task managment application", start_date: "10-10-2023", end_date: "30-1-2024", status: "In progress", user_id: tom.id },
  project_5 = { name: "REACT Project", description: "Build resturant website", start_date: "12-1-2023", end_date: "21-3-2023", status: "Completed", user_id: christine.id },
  project_6 = { name: "Stimulus Project", description: "Build E-commerce website", start_date: "2-12-2023", end_date: "2-1-2024", status: "Delayed", user_id: felipe.id },
  project_7 = { name: "Vue Project", description: "Build task managment application", start_date: "18-11-2023", end_date: "19-12-2023", status: "In progress", user_id: christine.id },
  project_8 = { name: "Javascript Project", description: "Build task managment application", start_date: "27-11-2023", end_date: "27-1-2024", status: "In progress", user_id: felipe.id },
  project_9 = { name: "CSS Project", description: "Build task managment application", start_date: "10-8-2023", end_date: "14-12-2023", status: "In progress", user_id: felipe.id },
  project_10 = { name: "HTML Project", description: "Build task managment application", start_date: "4-7-2023", end_date: "30-11-2023", status: "In progress", user_id: christine.id }
]

projects.each do |attribute|
  project = Project.create!(attribute)
  puts "create #{project.name}"
end
puts "Finished projects seeding!"

tasks = [
  task_1 = { title: "Design figma", priority: "Low", status: "Delayed", start:"#{Date.today}", end:"#{Date.today}",user_id:felipe.id},
  task_2 = { title: "Build frontend code", priority: "Medium", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id},
  task_3 = { title: "Build Backend code", priority: "High", status: "Completed", start:"13-10-2023", end:"13-10-2023",user_id:tom.id},
  task_4 = { title: "check functionality", priority: "High", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:felipe.id},
  task_5 = { title: "Meeting with Product Team", priority: "High", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id},
  task_6 = { title: "Daily Sprint", priority: "Medium", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id},
  task_7 = { title: "Meeting with Francesca", priority: "Low", status: "Delayed", start:"#{Date.today}", end:"#{Date.today}",user_id:felipe.id},
  task_8 = { title: "Standup meeting", priority: "Medium", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id},
  task_9 = { title: "Ruby Sprint", priority: "High", status: "Completed", start:"13-10-2023", end:"13-10-2023",user_id:tom.id},
  task_10 = { title: "Create sidebar", priority: "High", status: "In progress", start:"#{Date.tomorrow}", end:"#{Date.tomorrow}",user_id:felipe.id},
  task_11 = { title: "Finish Javascript logic", priority: "High", status: "In progress", start:"#{Date.tomorrow}", end:"#{Date.tomorrow}",user_id:christine.id},
  task_12 = { title: "Review Jeff's code", priority: "Medium", status: "In progress", start:"#{Date.tomorrow}", end:"#{Date.tomorrow}",user_id:christine.id},
  task_13 = { title: "Daily meeting", priority: "Medium", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id},
  task_14 = { title: "Call team manager", priority: "High", status: "In progress", start:"13-10-2023", end:"13-10-2023",user_id:tom.id},
  task_15 = { title: "REACT sprint", priority: "High", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:felipe.id},
  task_16 = { title: "Vue sprint", priority: "Medium", status: "In progress", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id},
  task_17 = { title: "Review application", priority: "Medium", status: "Delayed", start:"#{Date.today}", end:"#{Date.today}",user_id:christine.id}
]

tasks.each do |attribute|
  task= Task.create!(attribute)
  puts "create #{task.title}"
end

alert_1 = { title: "Drink Water", description: "Stay hydrated. Fill your water bottle.", user_id: felipe.id }
alert_2 = { title: "Feed Bowser!", description: "He already asked you 7 times!", user_id: felipe.id }
alert_3 = { title: "Time for a break!", description: "You have been working for 2 hours non-stop!", user_id: felipe.id }
alert_4 = { title: "Maybe it's time to close your laptop", description: "It's 8pm already! Don't keep Netflix waiting!", user_id: felipe.id }

[alert_1, alert_2, alert_3, alert_4].each do |attribute|
  alert = Alert.create!(attribute)
  puts "create #{alert.title}"
end


puts "Finished tasks seeding!"
