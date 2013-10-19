class Site < ActiveRecord::Base
  has_many :works
  has_many :teams, through: :works
  has_many :ranks

end
