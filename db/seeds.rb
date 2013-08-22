# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.delete_all
teams = [{
  name: 'Dangerzone',
  driver: 'Nathaniel Barnes',
  navigator: 'Holly Barnes',
  vehicle: '2001 Pontiac Aztek',
  pax: ''
},
{
  name: 'Strazzerinovich',
  driver: 'Adam Zaninovich',
  navigator: 'Elicia Strazzeri',
  vehicle: '2011 Ford Mustang V6 Coupe',
  pax: ''
},
{
  name: "Let's Get Frosty",
  driver: 'Tyler Clemens',
  navigator: 'Lauren Oas',
  vehicle: '2006 Ford Focus ZX4',
  pax: ''
}]
teams.each do |team|
  Team.create! team
end
