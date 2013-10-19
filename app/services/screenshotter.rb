class Screenshotter < Struct.new(:url)

  def self.run(*args)
    new(*args).screenshot
  end

  def screenshot
    driver.navigate.to url
    driver.manage.window.resize_to(default_width,default_height)
    file = driver.save_screenshot(temp_path)
    file.path
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