class Levelizer < Struct.new(:score)

  def self.run(*args)
    new(*args).level
  end

  def level
    Math.sqrt(score) * 0.3
  end

end