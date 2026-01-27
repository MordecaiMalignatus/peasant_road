require_relative './royal_road_client'

class Fic
  attr_accessor :title, :uri, :author
  attr_reader :rr

  def initialize(uri:)
    @uri = uri
    @rr = RoyalRoadClient.new
    info = @rr.fic_info(@uri.to_s)
    @author = info[:author]
    @title = info[:title]
  end

  def chapters
    @rr.chapters(@uri.to_s)
  end

  def persist

  end
end
