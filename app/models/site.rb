class Site < ActiveRecord::Base
  has_many :works
  has_many :teams, through: :works
  has_many :scores

  def need_score_refresh?
    last_score_at ? last_score_at < 8.week.ago : true
  end

  def last_score_at
    last_score.try(:created_at)
  end

  def screenshot
    last_score.screenshot
  end

  def points
    last_score.points
  end

  private

  def last_score
    scores.last
  end

end

