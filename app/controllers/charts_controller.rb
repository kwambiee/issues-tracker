class ChartsController < ApplicationController
  def index
    @status_data = Issue.group(:status).count
    @project_data = Issue.joins(:project).group('projects.title').count
  end
end
