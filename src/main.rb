require_relative './scraper'
require_relative './royal_road_client'
require_relative './config'

require 'pry'
require 'uri'


class Main
  attr_accessor :config
  attr_reader :rr

  def initialize
    @config = Config.read_from_disk
    @rr = RoyalRoadClient.new

    args = ARGV
    command = args[0]
    case command
    when command = "add" then cmd_add(args[1..])
    end
  end

  # Add a new fic to the state. Accepts either a full URL. Additional parameters
  # after the first are treated as additional URLs. Raises if one of the URLs is
  # malformed.
  def cmd_add(params)
    params.each do |p|
      uri = URI(p)
      raise 'Not an RR URL' if uri.host != "www.royalroad.com"
      unless @config.followed_stories.include?(uri.to_s) then
        @config.followed_stories << uri.to_s
      else
        puts "Followed #{uri.to_s}"
      end
    end

    @config.write_to_disk
  end
end

Main.new
