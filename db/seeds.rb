# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# User.destroy_all

# user1 = User.create!({
#   email: "maximerobertcolin@gmail.com"
# })

# user2 = User.create!({
#   email: "huretantoine@gmail.com"
# })

# p "Created #{User.count} users"

# Instrument.destroy_all

# Instrument.create!([{
#   user_id: user1.id,
#   name: "banjo",
#   category: "guitare",
#   price: 10,
#   description: "ceci est un banjo",
# },
# {
#   user_id: user1.id,
#   name: "batterie",
#   category: "percussion",
#   price: 20,
#   description: "ceci est une batterie",}
# ])

# p "Created #{Instrument.count} instruments"
