class AlexaRanker < Struct.new(:url)

  def self.run(*args)
    new(*args).points
  end

  def points
    normalize
  end

  def normalize
    (1.0 / fetch * bottom_position) + 5
  end

  def fetch
    rank = PageRankr.ranks(url, :alexa_global)
    rank[:alexa_global] || bottom_position
  end

  def bottom_position
    100_000_000
  end

end
