module ApplicationHelper
  def get_spotify_url(query)

    if query
      url = URI("https://spotify-web2.p.rapidapi.com/search/?q=#{query}&type=multi&offset=0&limit=10&numberOfTopResults=5")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["X-RapidAPI-Key"] = '0ece67adb4mshdfda884f682c206p1c719fjsn8c5a72687caf'
      request["X-RapidAPI-Host"] = 'spotify-web2.p.rapidapi.com'

      @response = JSON.parse(http.request(request))
      @rel_url = @response["albums"]["items"][0]["data"]["uri"].split("spotify:").last.gsub(":","/")
    end
  end
end
