class Ranker < Struct.new(:url, :score_id)

  def perform
    score = Score.find(score_id)
    score.update_attributes(points: points)
  end

  def points
    rank_engines.inject(0) do |result, engine|
      result + engine.run(url)
    end
  end

  private

  def rank_engines
    [ AlexaRanker ]
  end

end

