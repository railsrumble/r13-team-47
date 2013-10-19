class Rank < ActiveRecord::Base
  belongs_to :site
  has_one :screenshot
end
