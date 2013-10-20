class Levelizer < Struct.new(:score)

  def self.run(*args)
    new(*args).level
  end

  def level
  end

end