class Ranker < Struct.new(:url, :score_id, :team_id)

  def perform
    score = Score.find(score_id)
    score.push_points(points, team_id)
  end

  def points
    rank_engines.inject(0) do |result, engine|
      result + engine.run(url)
    end.to_i
  end

  private

  def rank_engines
    [ AlexaRanker ]
  end

end

