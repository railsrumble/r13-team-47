class Ranker < Struct.new(:url)

  def self.run(*args)
    new(*args).rank
  end

  def rank
    rank_engines.inject(0) do |result, engine|
      result + engine.run(url)
    end
  end

  private

  def rank_engines
    [ AlexaRanker ]
  end

end

