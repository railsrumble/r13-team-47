class Team < ActiveRecord::Base
  has_many :works
  has_many :sites, through: :works
end
