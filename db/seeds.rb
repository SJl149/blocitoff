# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  user = User.new(
    username: Faker::StarWars.unique.droid,
    email: Faker::Internet.email(Faker::StarWars.unique.character),
    password: 'password',
    password_confirmation: 'password'
  )
  user.save!
end
users = User.all

30.times do
  task = Task.new(
    name: Faker::Hacker.verb + " " + Faker::Food.ingredient,
    user: users.sample
  )
  task.save!
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
