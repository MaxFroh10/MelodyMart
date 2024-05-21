# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.destroy_all

user1 = User.create!({
  email: "maximerobertcolin@gmail.com",
  password: "123456"
})

user2 = User.create!({
  email: "huretantoine@gmail.com",
  password: "123456"
})

p "Created #{User.count} users"

Instrument.destroy_all

Instrument.create!([{
  user_id: user1.id,
  name: "banjo",
  category: "guitare",
  price: 10,
  description: "ceci est un banjo",
  picture: "https://d1aeri3ty3izns.cloudfront.net/media/64/647602/600/preview.jpg"}
,
{
  user_id: user1.id,
  name: "batterie",
  category: "percussion",
  price: 20,
  description: "ceci est une batterie",
  picture: "https://www.dwdrums.com/_next/image/?url=https%3A%2F%2Fa.storyblok.com%2Ff%2F165398%2F1644x1040%2F38d1e57402%2Fdw_key_drumrug_1644x1040.png&w=1080&q=75"},
])

p "Created #{Instrument.count} instruments"
