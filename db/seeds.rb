# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Team.create([
  {
    name: 'weLaika',
    url: 'http://dev.welaika.com',
    level: 10,
    score: 567,
    description: Faker::Lorem::sentences(10).join(' ')
  },
  {
    name: 'New Team',
    url: 'http://newteam.example.com',
    level: 56,
    score: 593835,
    description: Faker::Lorem::sentences(20).join(' ')
  },
  {
    name: 'Muppet',
    url: 'http://muppet.example.com',
    level: 7,
    score: 23,
    description: Faker::Lorem::sentences(5).join(' ')
  }
])
