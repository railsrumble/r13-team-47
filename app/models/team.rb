class Team < ActiveRecord::Base
  has_many :works
  has_many :sites, through: :works

  def self.random
    order("RAND()").first
  end
end
