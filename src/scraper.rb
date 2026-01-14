require 'nokogiri'
require 'httparty'
require 'json'
require_relative './config'

class Scraper
  attr_reader :config

  def initialize
    @config = read_db_file
  end


end
