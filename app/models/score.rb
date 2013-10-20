class Score < ActiveRecord::Base
  belongs_to :site
  mount_uploader :screenshot, ScreenshotUploader

  default_scope order(:created_at)

  def push_points(points, team_id)
    update_attributes(points: points)
    Pusher["team_#{team_id}"].trigger('push_points', {site_id: site.id, points: points})
  end

  def push_screenshot(screenshot_path, team_id)
    self.screenshot = File.open(screenshot_path)
    self.save
    Pusher["team_#{team_id}"].trigger('push_screenshot', {site_id: site.id, thumb_url: self.screenshot.thumb.url})
  end

end
