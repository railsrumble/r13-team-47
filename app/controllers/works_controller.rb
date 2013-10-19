class WorksController < ApplicationController
  inherit_resources

  belongs_to :team
end
