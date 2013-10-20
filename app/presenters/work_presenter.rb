class WorkPresenter < Showcase::Presenter

  def thumb
    h.image_tag object.screenshot.thumb, class: "site-thumb"
  end

  def host
    object.url.sub(/^https?\:\/\//, '') if object.url
  end

  def formatted_points
    "#{h.number_with_delimiter(object.points)} points"
  end

end
