module Scoreboard
  module ESPN
    class NFL
      def initialize(date)
        @date = date
        day = @date.to_s.gsub(/[^\d]+/, '')
        @markup ||= ESPN.get 'nfl', "scoreboard?date=#{day}"
      end

      def scores
        @markup.css('.mod-nfl-scorebox.final-state').map do |game|
          score = Score.new(date: @date)
          score.home_team = game.at_css('.home .team-name a').content
          score.away_team = game.at_css('.visitor .team-name a').content
          score.home_score = game.at_css('.home .score .final').content.to_i
          score.away_score = game.at_css('.visitor .score .final').content.to_i
          score
        end
      end
    end
  end
end