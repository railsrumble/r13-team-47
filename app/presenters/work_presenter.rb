class WorkPresenter < Showcase::Presenter

  def thumb
    if object.screenshot.blank?
      h.image_tag 'spinner.gif', class: "site-thumb spinner"
    else
      h.image_tag object.screenshot.thumb, class: "site-thumb"
    end
  end

  def host
    object.url.sub(/^https?\:\/\//, '') if object.url
  end

  def formatted_points
    "#{h.number_with_delimiter(object.points)} points"
  end

end
