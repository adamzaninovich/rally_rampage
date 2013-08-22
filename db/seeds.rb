# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.delete_all
team1 = {
  name: 'Dangerzone',
  driver: 'Nathaniel Barnes',
  navigator: 'Holly Barnes',
  vehicle: '2001 Pontiac Aztek',
  pax: ''
}
team2 = {
  name: 'Strazzerinovich',
  driver: 'Adam Zaninovich',
  navigator: 'Elicia Strazzeri',
  vehicle: '2011 Ford Mustang V6 Coupe',
  pax: ''
}
[team1,team2].each do |team|
  Team.create! team
end
