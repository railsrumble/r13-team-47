class TeamPresenter < Showcase::Presenter

  def host
    object.url.sub(/^https?\:\/\//, '') if object.url
  end

end

