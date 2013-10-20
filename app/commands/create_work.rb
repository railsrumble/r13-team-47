class CreateWork < Struct.new(:team, :params)

  def self.run(*args)
    new(*args).create
  end

  def create
    Work.create(params).tap do |work|
      SiteSaver.run(url, work)
    end
  end

  def url
    params[:url]
  end
end

