# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Order.create!(final_number:rand(10..99), total: rand(100..999), status: Order.statuses[:pending])
end

5.times do
  Order.create!(final_number:rand(100..199), total: rand(100..999), status: Order.statuses[:paid])
end

15.times do
  Order.create!(final_number:rand(200..299), total: rand(100..999), status: Order.statuses[:canceled])
end
