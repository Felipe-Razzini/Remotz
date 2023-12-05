class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  helper_method :dashboard_page?

  def home
    redirect_to new_user_session_path
  end

  def dashboard
    @projects = Project.includes(:user).all
    @projects_status_count = Project.group(:status).count
    @projects_workload_count = Project.joins(:user).group(:username).count
    @tasks_today = Task.where('DATE(start) = ?', Date.today)
    @task = Task.new
  end

  def music
    query = params[:query]
    @spotify_url = get_spotify_url(query) if query.present?
  end

  private

  def get_spotify_url(query)
    if query
      url = URI("https://spotify-web2.p.rapidapi.com/search/?q=#{query}&type=multi&offset=0&limit=10&numberOfTopResults=5")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = '0ece67adb4mshdfda884f682c206p1c719fjsn8c5a72687caf'
      request["X-RapidAPI-Host"] = 'spotify-web2.p.rapidapi.com'

      @response = JSON.parse(http.request(request).body)
      @rel_url = @response["albums"]["items"][0]["data"]["uri"].split("spotify:").last.gsub(":","/")
    end
  end
end
