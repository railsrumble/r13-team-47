class TeamRankUpdater < Struct.new(:team)

  def self.run(*args)
    new(*args).save
  end

  def save
    team.update_attributes(level: level, score: score)
  end

  def score
    @score ||= team.sites.map(&:scores).sum
  end

  def level
    @level ||= Levelizer.run(score)
  end

end

