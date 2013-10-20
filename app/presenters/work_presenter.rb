class WorkPresenter < Showcase::Presenter

  def thumb
    h.image_tag object.screenshot.thumb
  end

end
