class Work < ActiveRecord::Base
  belongs_to :team
  belongs_to :site

  delegate :url, :screenshot, :points, to: :site, allow_nil: true

end

