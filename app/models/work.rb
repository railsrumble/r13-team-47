class Work < ActiveRecord::Base
  belongs_to :team
  belongs_to :site
end
