class SiteSaver < Struct.new(:url, :work)

  def self.run(*args)
    new(*args).save
  end

  def save
    site = Site.find_or_create_by_url(url)
    work.update_attributes(site: site)
    refresh_score(site)
  end

  def refresh_score(site)
    if site.need_score_refresh?
      score = Score.create(site: site)
      Delayed::Job.enqueue Ranker.new(url, score.id, work.team_id)
      Delayed::Job.enqueue Screenshotter.new(url, score.id, work.team_id)
    end
  end

end

