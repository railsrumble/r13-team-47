class Work < ActiveRecord::Base
  attr_accessor :url

  belongs_to :team
  belongs_to :site

  delegate :url?, to: 'site', allow_nil: true

  before_save :save_site

  protected
    def save_site
      (site || create_site).update(url: url)
    end
end
