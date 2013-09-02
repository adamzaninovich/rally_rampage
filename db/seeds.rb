# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "Creating Stages"
Stage.delete_all
stages = [
  {
    stage_type: 'speed',
    pax_percent: 17.0
  },
  {
    stage_type: 'ideal_time',
    ideal_time: (1.minute),
  },
  {
    stage_type: 'odometer',
  },
  {
    stage_type: 'ideal_time',
    ideal_time: (1.hour  + 15.minutes)
  }
]
stages.each_with_index do |attrs, index|
  Stage.create! attrs.merge(order_number: index + 1)
end

puts "Creating Teams"
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

puts "Creating Stage Results"
StageResult.delete_all
Team.all.each do |team|
  Stage.all.each do |stage|
    team.stage_results.create stage: stage
  end
end
