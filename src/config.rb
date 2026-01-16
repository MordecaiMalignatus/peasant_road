require 'json'

STATE_HOME = "~/.config/peasant_road/"

# The Config is a simple JSON file that contains some basic settings and
# information. It's halfway between state file and configuration file, though it
# is intended to use CLI options to set options rather than edit this file
# directly.
class Config
  attr_accessor :last_run, :followed_stories

  def initialize(last_run:, followed_stories:)
    @last_run = last_run
    @followed_stories = followed_stories
  end

  def self.read_from_disk
    state_content = File.read(STATE_HOME + "config.json")
    config = JSON.parse(state_content, symbolize_names: true)
    new(**config)
  end
end
