require 'faker'
require'activerecord-reset-pk-sequence'

User.delete_all
User.reset_pk_sequence

Category.delete_all
Category.reset_pk_sequence

Room.delete_all
Room.reset_pk_sequence

Formation.delete_all
Formation.reset_pk_sequence

Session.delete_all
Session.reset_pk_sequence

#admin
1.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "admin", checked:"true")
end

#student
10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "student")
end

#teacher
5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "teacher")
end

arrFormation = [["JavaScript", "formation JavaScript débutant"], ["Ruby on Rails", "formation Ruby on Rails débutant"], ["Html5 / Css3", "formation Html5 / Css3 débutant"], ["Full-Stack (Frontend, Backend)", "formation Full-Stack (Frontend, Backend) débutant"]]

arrFormation.each { |formation| Formation.create(title:formation[0], description:formation[1], user_id: User.last.id) }

5.times do
Category.create(name: Faker::Game.genre)
end

10.times do 
Room.create(room_number: Faker::Number.between(from: 1, to: 10) )
end

5.times do
Session.create(date: (DateTime.now + (rand * 21)).to_s, duration:1, formation_id: Formation.all[rand(0..2)].id, room_id: Room.all[rand(0..5)].id)
end
