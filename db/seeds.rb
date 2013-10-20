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

unless Team.find_by(name: 'Long team name for test')
  Team.create name: 'Long team name for test',
              url: 'http://ltnft.com',
              level: 72,
              score: 23214234,
              description: Faker::Lorem::sentences(15).join(' ')
end

unless Team.find_by(name: 'SEBP Team')
  Team.create name: 'SEBP Team',
              url: 'http://sebp.example.com',
              level: 74,
              score: 2214234,
              description: Faker::Lorem::sentences(15).join(' ')
end

[
  {name: 'dev.welaika.com', url: 'http://dev.welaika.com'},
  {name: 'reddit', url: 'http://reddit.com'}
].each do |site|
  unless Work.find_by(name: site[:name])
    work = Work.create(name: site[:name])
    SiteSaver.run(site[:url], work)
  end
end

# # # # # # # # #
# Sample users
# # # # # # # # #

# User.where(sample: true).each do |sample_user|
#   sample_user.teams.each do |sample_team|
#     sample_team.works.map(&:destroy)
#   end
#   sample_user.teams.map(&:destroy)
#   sample_user.destroy
# end

# alice = User.create(login: 'alice', sample: true)
# team = Team.create(name: 'Alice in Wanderland', description: Faker::Lorem.paragraphs(4).join("\n\n"), url: 'http://www.lipsum.com/')
# google = Work.create(name: 'Google', url: 'http://www.google.com')
# yahoo = Work.create(name: 'Yahoo!', url: 'http://www.yahoo.com')
# alexa = Work.create(name: 'Alexa', url: 'http://www.alexa.com')

# alice.teams << team

# team.works << google
# team.works << yahoo
# team.works << alexa
