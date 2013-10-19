class Team < ActiveRecord::Base
  has_many :works
  has_many :sites, through: :works

  has_and_belongs_to_many :users

  def self.random
    order("RAND()").first
  end
end
