class Score < ActiveRecord::Base
  belongs_to :site
  mount_uploader :screenshot, ScreenshotUploader
end
