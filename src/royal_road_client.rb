require 'httparty'

class RoyalRoadClient
  include HTTParty
  base_uri 'royalroad.com'

  def initialize(id)
    @id = id
    @options = {query: {} }
  end

  def fic_information
    self.class.get("/fiction/#{@id}/")
  end

  def chapters
    doc = Nokogiri::HTML(fic_information)
    doc.css '.'
  end

  def chapter(chapter_uri)
    self.class.get("/fiction/#{@id}/chapter/#{chapter_uri}")
  end
end
