# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "cloudinary"


puts 'Cleaning database...'

Project.destroy_all
Task.destroy_all
User.destroy_all
Alert.destroy_all
Chatroom.destroy_all

Chatroom.create(name: "General")

file_path = File.open(Rails.root.join('app/assets/images/Avatar-Felipe.jpg'))
felipe = User.create!(email: 'feliperazzini@hotmail.com', password: 'felipe', username: 'Felipe', avatar: "Avatar-Felipe.jpg")
christine = User.create!(email: 'christine.onsi@gmail.com', password: 'chris123', username: 'Christine')
tom = User.create!(email: 'test@test1.com', password: '12ss23', username: 'Tom')

projects = [
  project_1 = { name: "Task management application", description: "Build task managment application", start_date: "13-11-2023", end_date: "30-1-2024", status: "In progress", user_id: felipe.id },
  project_2 = { name: "Resturant website", description: "Build resturant website", start_date: "14-11-2023", end_date: "12-12-2023", status: "In progress", user_id: christine.id },
  project_3 = { name: "E-commerce website", description: "Build E-commerce website", start_date: "14-12-2023", end_date: "14-2-2024", status: "Delayed", user_id: tom.id },
  project_4 = { name: "Ruby Project", description: "Build task managment application", start_date: "10-10-2023", end_date: "30-1-2024", status: "Completed", user_id: tom.id },
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
  task_4 = { title: "Check functionality", priority: "Low", status: "Completed", start:"5-12-2023", end:"5-12-2023",user_id:felipe.id},
  task_5 = { title: "Meeting with Product Team", priority: "High", status: "Completed", start:"5-12-2023", end:"5-12-2023",user_id:christine.id},
  task_1 = { title: "Figma design", priority: "Low", status: "Completed", start:"6-12-2023", end:"6-12-2023",user_id:felipe.id},
  task_2 = { title: "Build frontend code", priority: "Medium", status: "Completed", start:"6-12-2023", end:"6-12-2023",user_id:christine.id},
  task_3 = { title: "Build Backend code", priority: "High", status: "Completed", start:"6-12-2023", end:"6-12-2023",user_id:tom.id},
  task_6 = { title: "Daily Sprint", priority: "Medium", status: "In progress", start:"7-12-2023", end:"7-12-2023",user_id:christine.id},
  task_7 = { title: "Highlight Button", priority: "Low", status: "Delayed", start:"7-12-2023", end:"7-12-2023",user_id:felipe.id},
  task_8 = { title: "Standup meeting", priority: "Medium", status: "In progress", start:"7-12-2023", end:"7-12-2023",user_id:christine.id},
  task_9 = { title: "Ruby Sprint", priority: "High", status: "In progress", start:"7-12-2023", end:"7-12-2023",user_id:tom.id},
  task_10 = { title: "Create sidebar", priority: "High", status: "In progress", start:"8-12-2023", end:"8-12-2023",user_id:felipe.id},
  task = { title: "Bootstrap sprint", priority: "High", status: "Completed", start:"8-12-2023", end:"8-12-2023", user_id:felipe.id},
  task = { title: "Design button", priority: "High", status: "In progress", start:"8-12-2023", end:"8-12-2023",user_id:felipe.id},
  task_11 = { title: "Finish Javascript logic", priority: "High", status: "In progress", start:"8-12-2023", end:"8-12-2023",user_id:felipe.id},
  task_12 = { title: "Review Jeff's code", priority: "Medium", status: "In progress", start:"8-12-2023", end:"8-12-2023",user_id:felipe.id},
  task_13 = { title: "Daily meeting", priority: "Medium", status: "In progress", start:"8-12-2023", end:"8-12-2023",user_id:felipe.id},
  task_14 = { title: "Call team manager", priority: "High", status: "In progress", start:"11-12-2023", end:"11-12-2023",user_id:tom.id},
  task_15 = { title: "REACT sprint", priority: "High", status: "In progress", start:"11-12-2023", end:"11-12-2023",user_id:felipe.id},
  task_16 = { title: "Vue sprint", priority: "Medium", status: "In progress", start:"11-12-2023", end:"11-12-2023",user_id:tom.id},
  task_17 = { title: "Review application", priority: "Medium", status: "Delayed", start:"11-12-2023", end:"11-12-2023",user_id:tom.id},
  task_18 = { title: "Create sidebar", priority: "High", status: "In progress", start:"12-12-2023", end:"12-12-2023",user_id:felipe.id},
  task_19 = { title: "Finish Javascript logic", priority: "High", status: "In progress", start:"12-12-2023", end:"12-12-2023",user_id:tom.id},
  task_20 = { title: "Review Jeff's code", priority: "Medium", status: "In progress", start:"12-12-2023", end:"12-12-2023",user_id:tom.id},
  task_21 = { title: "Daily meeting", priority: "Medium", status: "In progress", start:"12-12-2023", end:"12-12-2023",user_id:tom.id},
  task_22 = { title: "Call team manager", priority: "High", status: "In progress", start:"13-12-2023", end:"13-12-2023",user_id:tom.id},
  task_23 = { title: "REACT sprint", priority: "High", status: "In progress", start:"13-12-2023", end:"13-12-2023",user_id:felipe.id},
  task_24 = { title: "Vue sprint", priority: "Medium", status: "In progress", start:"13-12-2023", end:"13-12-2023",user_id:tom.id},
  task_25 = { title: "Review application", priority: "Medium", status: "Delayed", start:"13-12-2023", end:"13-12-2023",user_id:felipe.id},
  task_26 = { title: "Create sidebar", priority: "High", status: "In progress", start:"13-12-2023", end:"13-12-2023",user_id:felipe.id},
  task_27 = { title: "Finish Javascript logic", priority: "High", status: "In progress", start:"13-12-2023", end:"13-12-2023",user_id:christine.id},
  task_28 = { title: "Review Jeff's code", priority: "Medium", status: "In progress", start:"14-12-2023", end:"14-12-2023",user_id:christine.id},
  task_29 = { title: "Daily meeting", priority: "Medium", status: "In progress", start:"14-12-2023", end:"14-12-2023",user_id:christine.id},
  task_30 = { title: "Call team manager", priority: "High", status: "In progress", start:"14-12-2023", end:"14-12-2023",user_id:felipe.id},
  task_31 = { title: "REACT sprint", priority: "High", status: "In progress", start:"14-12-2023", end:"14-12-2023",user_id:felipe.id},
  task_32 = { title: "Vue sprint", priority: "Medium", status: "In progress", start:"14-12-2023", end:"14-12-2023",user_id:christine.id},
  task_33 = { title: "Review application", priority: "Medium", status: "Delayed", start:"15-12-2023", end:"15-12-2023",user_id:christine.id},
  task_34 = { title: "Create sidebar", priority: "High", status: "In progress", start:"15-12-2023", end:"15-12-2023",user_id:felipe.id},
  task_35 = { title: "Finish Javascript logic", priority: "High", status: "In progress", start:"15-12-2023", end:"15-12-2023",user_id:christine.id},
  task_36 = { title: "Review Jeff's code", priority: "Medium", status: "In progress", start:"15-12-2023", end:"15-12-2023",user_id:christine.id},
  task_37 = { title: "Daily meeting", priority: "Medium", status: "In progress", start:"15-12-2023", end:"15-12-2023",user_id:christine.id},
  task_38 = { title: "Call team manager", priority: "High", status: "In progress", start:"15-12-2023", end:"15-12-2023",user_id:tom.id},
  task_39 = { title: "REACT sprint", priority: "High", status: "In progress", start:"18-12-2023", end:"18-12-2023",user_id:felipe.id},
  task_40 = { title: "Vue sprint", priority: "Medium", status: "In progress", start:"18-12-2023", end:"18-12-2023",user_id:christine.id},
  task_41 = { title: "Review application", priority: "Medium", status: "Delayed", start:"18-12-2023", end:"18-12-2023",user_id:christine.id},
  task_42 = { title: "Create sidebar", priority: "High", status: "In progress", start:"18-12-2023", end:"18-12-2023",user_id:felipe.id},
  task_43 = { title: "Finish Javascript logic", priority: "High", status: "In progress", start:"19-12-2023", end:"19-12-2023",user_id:christine.id},
  task_44 = { title: "Review Jeff's code", priority: "Medium", status: "In progress", start:"19-12-2023", end:"19-12-2023",user_id:christine.id},
  task_45 = { title: "Daily meeting", priority: "Medium", status: "In progress", start:"19-12-2023", end:"19-12-2023",user_id:christine.id},
  task_46 = { title: "Call team manager", priority: "High", status: "In progress", start:"19-12-2023", end:"19-12-2023",user_id:tom.id},
  task_47 = { title: "REACT sprint", priority: "High", status: "In progress", start:"19-12-2023", end:"19-12-2023",user_id:felipe.id},
  task_48 = { title: "Vue sprint", priority: "Medium", status: "In progress", start:"20-12-2023", end:"20-12-2023",user_id:christine.id},
  task_49 = { title: "Review application", priority: "Medium", status: "Delayed", start:"20-12-2023", end:"20-12-2023",user_id:christine.id}
]

tasks.each do |attribute|
  task= Task.create!(attribute)
  puts "create #{task.title}"
end

alerts = [
  alert_1 = { title: "Drink Water", description: "Stay hydrated. Fill your water bottle.", user_id: felipe.id },
  alert_2 = { title: "Feed Bowser!", description: "He already asked you 7 times!", user_id: felipe.id },
  alert_3 = { title: "Time for a break!", description: "You have been working for 2 hours non-stop!", user_id: felipe.id },
  alert_4 = { title: "Maybe it's time to close your laptop", description: "It's 8pm already! Don't keep Netflix waiting!", user_id: felipe.id }
]


[alert_1, alert_2, alert_3, alert_4].each do |attribute|
  alert = Alert.create!(attribute)
  puts "create #{alert.title}"
end

suggestions = [
  { title: 'Take a Walk', description: 'Get some fresh air. Take a short walk outside.' },
  { title: 'Read a Book', description: 'Spend some time reading a good book.' },
  { title: 'Exercise', description: 'Move your body. Do a quick workout or stretch.' },
  { title: 'Eat Healthy', description: 'Have a balanced meal with fruits and vegetables.' },
  { title: 'Practice Mindfulness', description: 'Take a few minutes to practice mindfulness or meditation.' },
  { title: 'Plan Your Day', description: 'Set goals and plan your tasks for the day.' },
  { title: 'Get Enough Sleep', description: 'Ensure you get a good night\'s sleep.' },
  { title: 'Call a Friend', description: 'Connect with a friend or loved one.' },
  { title: 'Learn Something New', description: 'Pick up a new skill or knowledge.' },
  { title: 'Express Gratitude', description: 'Take a moment to appreciate and express gratitude.' },
  { title: 'Organize Workspace', description: 'Declutter and organize your workspace.' },
  { title: 'Take Breaks', description: 'Take short breaks to refresh and recharge.' },
  { title: 'Listen to Music', description: 'Enjoy some music for relaxation.' },
  { title: 'Set Priorities', description: 'Prioritize tasks to focus on what matters most.' }
]

suggestions.each do |attributes|
  suggestion = Suggestion.create!(attributes)
  puts "create #{suggestion.title}"
end

puts "Finished tasks seeding!"
