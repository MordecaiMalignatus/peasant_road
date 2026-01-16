require 'nokogiri'
require 'httparty'

require_relative './config'

class Scraper
  attr_reader :config

  def initialize
    @config = read_db_file
  end

  # Query the main page of a fic, and obtain its chapter links. This usually
  # requires some pagination, and some careful handling of caching.
  def read_fic_table_of_content(url)
    resp = HTTParty.get url

  end
end
