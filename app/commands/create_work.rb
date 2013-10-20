class CreateWork < Struct.new(:team, :params, :url)

  def self.run(*args)
    new(*args).create
  end

  def create
    Work.create(params).tap do |work|
      SiteSaver.run(url, work, team)
    end
  end
end

