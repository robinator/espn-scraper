require 'scoreboard/fetcher'

module Scoreboard
  module ESPN
    include Fetcher
    extend self

    def supported_leagues
      [:nba, :nfl] 
    end

    def scores_url
      'http://scores.espn.go.com/'
    end
  end
end

Scoreboard::ESPN.supported_leagues.each do |name|
  require "scoreboard/sources/espn/#{name}"
end