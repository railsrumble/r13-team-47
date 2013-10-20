class Score < ActiveRecord::Base
  belongs_to :site
  mount_uploader :screenshot, ScreenshotUploader

  default_scope order(:created_at)

end
