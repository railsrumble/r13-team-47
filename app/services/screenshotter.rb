class Screenshotter < Struct.new(:url, :score_id)

  def perform
    score = Score.find(score_id)
    score.screenshot = File.open(screenshot)
    score.save
  end

  def screenshot
    driver.navigate.to url
    driver.manage.window.resize_to(default_width,default_height)
    driver.save_screenshot(temp_path).path
  end

  private

  def default_width
    1024
  end

  def default_height
    768
  end

  def driver
    @driver ||= Selenium::WebDriver.for :phantomjs
  end

  def temp_path
    File.join('/tmp', Dir::Tmpname.make_tmpname(['screenshot-', '.png'], nil))
  end

end
