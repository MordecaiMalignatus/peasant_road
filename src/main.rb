require_relative './royal_road_client'
require_relative './fic'
require_relative './config'

require 'pry'
require 'uri'
require 'pp'

class Main
  attr_accessor :config
  attr_reader :rr

  def initialize
    @config = Config.read_from_disk
    @rr = RoyalRoadClient.new

    args = ARGV
    command = args[0]
    case command
    when "add" then cmd_add(args[1..])
    when "pull" then cmd_pull(args[1..])
    end
  end

  # Add a new fic to the state. Accepts either a full URL. Additional parameters
  # after the first are treated as additional URLs. Raises if one of the URLs is
  # malformed.
  def cmd_add(params)
    params.each do |p|
      uri = URI(p)
      raise 'Not an RR URL' if uri.host != "www.royalroad.com"

      unless @config.followed_stories.include?(uri.to_s)
        @config.followed_stories << uri.to_s
        puts "Followed #{uri.to_s}"
      else
        puts "Aready followed this fic, skipping config edit."
      end

      pp Fic.new(uri: p)
    end

    @config.write_to_disk
  end

  # For each followed fic, pull all the chapters, save the new ones, and
  # progress report.
  def cmd_pull(params)

  end
end

Main.new
