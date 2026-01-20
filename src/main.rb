require_relative './scraper'
require_relative './royal_road_client'

require 'pry'

class Main
  def self.main
    rr = RoyalRoadClient.new('107917')
    chapters = rr.chapters
    content = rr.chapter(chapters["Chapter 14- Making Do With What You Have"])
    puts content
  end
end

Main.main
