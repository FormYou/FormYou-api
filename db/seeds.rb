# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Category.destroy_all
# Formation.destroy_all

10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "student")
end

5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "teacher")
end

1.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"azerty", password_confirmation:"azerty", role: "admin", checked:"true")
end

# 10.times do 
#   Formation.create(title: Faker::ProgrammingLanguage.name, description: Faker::Alphanumeric.alpha(number: 20), user_id:"user_id",)
# end
# Formation.create(title: "hellotitle", description: "0123456789fefgfhfhhfhvjhvhjvhkvhkvhk!bgjjgcygnjvjgcghtj12345678902222", user_id: "31")
5.times do
Category.create(name: Faker::Game.genre)
end