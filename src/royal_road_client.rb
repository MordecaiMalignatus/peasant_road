require 'httparty'

class RoyalRoadClient
  include HTTParty
  base_uri 'royalroad.com'

  def initialize(id)
    @id = id
    @options = {query: {} }
  end

  # Pick out the chapter titles and their URLs.
  def chapters
    toc = self.class.get("/fiction/#{@id}/")
    doc = Nokogiri::HTML(toc.body)
    links = doc.css('.chapter-row').map {|row| row.css('a')[0] }
    links.map {|link| [link.content().strip, link['href']]}.to_h
  end

  # Query a chapter with its full URI and return the body HTML as a NodeSet.
  def chapter(uri)
    resp = self.class.get(uri)
    doc = Nokogiri::HTML(resp.body)
    doc.css '.chapter-content'
  end
end
