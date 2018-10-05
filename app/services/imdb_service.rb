class ImdbService
  @api_key = Rails.application.credentials.TMDB_api_key
  class << self
    def api_key
      @api_key
    end

    def get_image_by_title(title)
      response = HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&query=#{title}").to_s
      parsed_response = JSON.parse(response)
      parsed_response = "https://image.tmdb.org/t/p/w600_and_h900_bestv2#{parsed_response["results"][0]["poster_path"]}"
    end

    def get_overview_by_title(title)
      response = HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&query=#{title}").to_s
      parsed_response = JSON.parse(response)
      parsed_response = parsed_response["results"][0]["overview"]
    end
    def get_release_date_by_title(title)
      response = HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&query=#{title}").to_s
      parsed_response = JSON.parse(response)
      parsed_response = parsed_response["results"][0]["release_date"] 
    end
end
end
