class MovieDecorator < Draper::Decorator
  delegate_all

  def initialize(object, options = {})
    @details = MovieDetails.new(object).call
    super
  end

  def plot
    @details["plot"]
  end

  def rating
    @details["rating"]
  end

  def poster
    MovieDetails::base_uri + @details["poster"]
  end

  def cover
    "http://lorempixel.com/100/150/" +
      %w(abstract nightlife transport).sample +
      "?a=" + SecureRandom.uuid
  end
end
