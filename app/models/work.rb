class Work < ActiveRecord::Base
  belongs_to :team
  belongs_to :site

  delegate :url, to: :site, allow_nil: true
  delegate :screenshot, to: :site, allow_nil: true

end
