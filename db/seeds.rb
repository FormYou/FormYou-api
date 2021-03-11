# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
# Formation.destroy_all
1.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "admin", checked:"true")
end

10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "student")
end

5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "teacher")
end

arrformation = [["JavaScript", "formation JavaScript débutant"], ["Ruby on Rails", "formation Ruby on Rails débutant"], ["Html5 / Css3", "formation Html5 / Css3 débutant"], ["Full-Stack (Frontend, Backend)", "formation Full-Stack (Frontend, Backend) débutant"]]

arrformation.each { |formation| Formation.create(title:formation[0], description:formation[1],user_id:User.last.id) }

5.times do
Category.create(name: Faker::Game.genre)
end
10.times do 
Room.create(room_number: Faker::Number.between(from: 1, to: 10) )
end

5.times do
Session.create(date:'2021-06-15 08:00:00', duration:1, formation_id:Formation.first.id, room_id:Room.first.id)
end