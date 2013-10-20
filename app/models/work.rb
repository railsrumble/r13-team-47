class Work < ActiveRecord::Base
  attr_accessor :url

  belongs_to :team
  belongs_to :site

  delegate :url?, to: 'site', allow_nil: true

end
