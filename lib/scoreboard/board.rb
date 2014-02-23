module Scoreboard
  class Board

    attr_accessor :league, :date, :week

    def initialize(league, date: date, week: week, source: :espn)
      @source = Scoreboard.const_get source.upcase
      @league = @source.const_get league.upcase
      @date = date
      @week = week
    end

    def scores
      @league.new(@date).scores
    end

  end
end
