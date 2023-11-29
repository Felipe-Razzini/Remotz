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

user1 = User.create!(email: 'test@test3.com', password: '123123')
user2 = User.create!(email: 'test@test2.com', password: '123ed23')
user3 = User.create!(email: 'test@test1.com', password: '12ss23')

project_1 = {name:"Task management application" ,description:"Build task managment application", start_date:"13-10-2023", end_date:"30-10-2023", completed:false,user_id:user1.id}
project_2 = {name:"Resturant website" ,description:"Build resturant website", start_date:"1-11-2023", end_date:"25-11-2023", completed:false, user_id:user2.id  }
project_3 = {name:"E-commerce website" ,description:"Build E-commerce website", start_date:"1-12-2023", end_date:"30-12-2023", completed:false, user_id:user3.id  }

[project_1,project_2,project_3].each do |proj|
  project = Project.create!(proj)
  puts "create #{project.name}"
end
puts "Finished projects seeding!"

task_1 = {title:"Design figma", priority:"Low", completed:false, start:"13-10-2023", end:"30-10-2023",user_id:user2.id}
task_2 = {title:"Build frontend code", priority:"Medium", completed:false, start:"1-11-2023", end:"25-11-2023",user_id:user3.id}
task_3 = {title:"Build Backend code", priority:"High", completed:false, start:"13-10-2023", end:"30-10-2023",user_id:user3.id}
task_4 = {title:"check functionality", priority:"High", completed:false, start:"1-12-2023", end:"30-12-2023",user_id:user1.id}

[task_1,task_2,task_3,task_4].each do |task|
  task= Task.create!(task)
  puts "create #{task.title}"
end
puts "Finished tasks seeding!"
