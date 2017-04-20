class MovieDecorator < Draper::Decorator
  delegate_all
  decorates_association :genre

  def initialize(object, options = {})
    @details = nil
    super
  end

  def plot
    retrieve_details if @details.nil?
    @details["plot"]
  end

  def rating
    retrieve_details if @details.nil?
    @details["rating"]
  end

  def poster
    retrieve_details if @details.nil?
    MovieDetails::base_uri + @details["poster"]
  end

  def cover
    "http://lorempixel.com/100/150/" +
      %w(abstract nightlife transport).sample +
      "?a=" + SecureRandom.uuid
  end

  private

  def retrieve_details
    @details = MovieDetails.new(object).call
  end
end
