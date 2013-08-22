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
  driver: 'Nathaniel',
  navigator: 'Holly',
  vehicle: '2001 Pontiac Aztek',
  pax: '0.866'
},
{
  name: 'Strazzerinovich',
  driver: 'Adam',
  navigator: 'Elicia',
  vehicle: '2011 Ford Mustang V6 Coupe',
  pax: '0.826'
},
{
  name: "Let's Get Frosty",
  driver: 'Tyler',
  navigator: 'Lauren',
  vehicle: '2006 Ford Focus ZX4',
  pax: '0.804'
},
{
  name: "Katia's Epic Win",
  driver: 'Alex',
  navigator: 'Katia',
  vehicle: '2013 Honda Fit',
  pax: '0.795'
},
{
  name: "Anarchy",
  driver: 'Myron',
  navigator: 'Shalyn',
  vehicle: '2008 Lexus IS250',
  pax: '0.826'
},
{
  name: "Amish",
  driver: 'Jared',
  navigator: 'Caitlin',
  vehicle: '2012 Hyundai Sonata GL',
  pax: '0.827'
}]
teams.each do |team|
  Team.create! team
end
