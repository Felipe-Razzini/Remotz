class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  helper_method :dashboard_page?

  def home
  end

  def dashboard
    @projects = Project.includes(:user).all
    @projects_status_count = Project.group(:status).count
    @projects_workload_count = Project.joins(:user).group(:username).count
    @tasks_today = Task.where('DATE(start) = ?', Date.today)
  end
end
