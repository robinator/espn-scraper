module Scoreboard
  module ESPN
    class NBA
      def initialize(date)
        @date = date
        day = @date.to_s.gsub(/[^\d]+/, '')
        @markup ||= ESPN.get 'nba', "scoreboard?date=#{day}"
      end

      def scores
        @markup.css('.mod-scorebox.final-state').map do |game|
          score = Score.new(date: @date)
          score.home_team = game.at_css('.team.home .team-name a').content
          score.away_team = game.at_css('.team.away .team-name a').content
          score.home_score = game.at_css('.team.home .finalScore').content.to_i
          score.away_score = game.at_css('.team.away .finalScore').content.to_i
          score
        end
      end
    end
  end
end