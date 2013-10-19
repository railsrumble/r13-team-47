# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# # # # #
# Teams
# # # # #

unless Team.find_by(name: 'weLaika')
  Team.create name: 'weLaika',
              url: 'http://dev.welaika.com',
              level: 10,
              score: 567,
              description: Faker::Lorem::sentences(10).join(' ')
end

unless Team.find_by(name: 'New Team')
  Team.create name: 'New Team',
              url: 'http://newteam.example.com',
              level: 56,
              score: 593835,
              description: Faker::Lorem::sentences(20).join(' ')
end

unless Team.find_by(name: 'Muppet')
  Team.create name: 'Muppet',
              url: 'http://muppet.example.com',
              level: 7,
              score: 23,
              description: Faker::Lorem::sentences(5).join(' ')
end

# # # # # # # # #
# Sample users
# # # # # # # # #

User.where(sample: true).each do |sample_user|
  sample_user.teams.each do |sample_team|
    sample_team.works.map(&:destroy)
  end
  sample_user.teams.map(&:destroy)
  sample_user.destroy
end

alice = User.create(login: 'alice', sample: true)

team = alice.teams.create(name: 'Alice in Wanderland')

google = team.sites.create(url: 'http://www.google.com')
yahoo = team.sites.create(url: 'http://www.yahoo.com')
alexa = team.sites.create(url: 'http://www.alexa.com')