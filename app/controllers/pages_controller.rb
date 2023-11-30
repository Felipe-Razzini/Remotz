class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
  end

  def dashboard
    @projects = Project.all
    @tasks_today = Task.where('DATE(start) = ?', Date.today)
    @projects_status_count = Project.group(:status).count
  end
end
