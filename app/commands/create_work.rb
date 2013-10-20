class CreateWork < Struct.new(:team, :params, :url)

  def self.run(*args)
    new(*args).create
  end

  def create
    Work.create(work_params.merge({team: team})).tap do |work|
      SiteSaver.run(site_url, work)
    end
  end

  private

    def site_url
      params[:work][:url]
    end

    def work_params
      params.require(:work).permit(:name)
    end

end

