require 'scoreboard/score'
require 'scoreboard/board'

module Scoreboard
  extend self

  def all_sources
    [:espn]
  end

  def scores(league, date)
    Board.new(league, date: date).scores
  end

end

Scoreboard.all_sources.each do |name|
  require "scoreboard/sources/#{name}"
end