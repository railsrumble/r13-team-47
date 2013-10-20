class Site < ActiveRecord::Base
  has_many :works
  has_many :teams, through: :works
  has_many :scores

  def need_score_refresh?
    last_score_at ? last_score_at < 1.week.ago : true
  end

  def last_score_at
    scores.last.try(:created_at)
  end

end

