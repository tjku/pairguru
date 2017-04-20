require "rails_helper"

describe MovieDetails do
  subject { MovieDetails.new(movie) }

  let(:movie) { FactoryGirl.create :movie }

  describe "External request" do
    it "queries Netguru training heroku app" do
      expect(subject.call).to be_instance_of(Hash)
    end
  end
end
