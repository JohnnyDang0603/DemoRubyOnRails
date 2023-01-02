# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#user

# 100.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: 'khoa123'
#   )
# end


# user = User.first
# 20.times do
#   Friend.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.safe_email,
#     phone: Faker::PhoneNumber.cell_phone,
#     twitter: Faker::Name.first_name,
#     user_id: rand(1..10)
#   )
# end

# 20.times do
#   Project.create!(
#     project_name: Faker::Name.name,
#     project_type: "school",
#     description: Faker::Name.name,
#     area: Faker::Config.locale = 'es',
#     status: Faker::Subscription.status,
#     address: Faker::Address.full_address
#   )
# end

5.times do
  UsersProject.create!(
    user_id: rand(1..10),
    project_id: rand(1..20)
  )
end
