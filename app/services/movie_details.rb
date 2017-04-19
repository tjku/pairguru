require "httparty"

class MovieDetails
  include HTTParty

  base_uri "https://pairguru-api.herokuapp.com"

  def initialize(object)
    @title = object.title
  end

  def call
    response = self.class.get("/api/v1/movies/#{URI.encode @title}")

    if response.success?
      response["data"]["attributes"]
    else
      raise response.response
    end
  end
end
