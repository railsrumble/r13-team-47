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
              level: 0,
              score: 0,
              description: Faker::Lorem::sentences(10).join(' ')
end

unless Team.find_by(name: 'New Team')
  Team.create name: 'New Team',
              url: 'http://newteam.example.com',
              level: 0,
              score: 0,
              description: Faker::Lorem::sentences(20).join(' ')
end

unless Team.find_by(name: 'Muppet')
  Team.create name: 'Muppet',
              url: 'http://muppet.example.com',
              level: 0,
              score: 0,
              description: Faker::Lorem::sentences(5).join(' ')
end

unless Team.find_by(name: 'Long team name for test')
  Team.create name: 'Long team name for test',
              url: 'http://ltnft.com',
              level: 0,
              score: 0,
              description: Faker::Lorem::sentences(15).join(' ')
end

unless Team.find_by(name: 'SEBP Team')
  Team.create name: 'SEBP Team',
              url: 'http://sebp.example.com',
              level: 0,
              score: 0,
              description: Faker::Lorem::sentences(15).join(' ')
end

sites = [
  {name: 'dev.welaika.com', url: 'http://dev.welaika.com'},
  {name: 'Biennale Democrazia', url: 'http://biennaledemocrazia.it'},
  {name: 'Vintage Contemporaneo', url: 'http://vintagecontemporaneo.it/'},
  {name: '100 + 1 cose da fare in Sardegna', url: 'https://www.101cosedafareinsardegna.it/'},
  {name: 'Dreher Italy', url: 'http://dreher.it/'},
  {name: 'EDT', url: 'http://www.edt.it/'},
  {name: 'L\'Arena Affari casa', url: 'http://casa.larenaffari.it/'},
  {name: 'Camar S.p.a', url: 'http://www.camar.it/'},
  {name: 'Intesa San Paolo', url: 'http://www.intesasanpaolo.com/'},
  {name: 'weLaika Lab', url: 'http://lab.welaika.com/'}
]

Team.all.each do |team|
  sites.sample(6).uniq.each do |site|
    work = Work.create(name: site[:name])
    team.works << work
    SiteSaver.run(site[:url], work)
  end
end

