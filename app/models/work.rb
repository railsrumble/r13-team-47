class Work < ActiveRecord::Base
  attr_accessor :url

  belongs_to :team
  belongs_to :site
end
