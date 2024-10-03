# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
# create owner
Owner.destroy_all
10.times do
  Owner.create!(nickname: Faker::Internet.user[:username])
end

# create cars and randomly assign owner
20.times do
  brand = Faker::Vehicle.make
  Car.create(
    brand: brand,
    model: Faker::Vehicle.model(make_of_model: brand),
    year: Faker::Vehicle.year,
    fuel: Faker::Vehicle.fuel_type,
    owner_id: Owner.all.sample.id
  )
end
