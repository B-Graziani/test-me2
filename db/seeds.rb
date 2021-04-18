# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning DB"
Restaurant.destroy_all
puts "creating DB"
resto1 = { name: "Mcdo", address: "place de clichy", chef_name: "Boris"}
resto2 = { name: "Kfc", address: "Avenue de clichy", chef_name: "Marco"}
resto3 = { name: "Subway", address: "Chateau de clichy", chef_name: "Jena"}
Restaurants = []
[resto1, resto2, resto3].each_with_index do |attributes, index|
restaurant = Restaurant.create!(attributes)
Restaurants << restaurant
end
