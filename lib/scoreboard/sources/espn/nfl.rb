module Scoreboard
  module ESPN
    class NFL
      def initialize(date)
        @date = date
        day = @date.to_s.gsub(/[^\d]+/, '')
        @markup ||= ESPN.get 'nfl', "scoreboard?date=#{day}"
      end

      def scores
        # game_dates = doc.css('.games-date text()').map do |node|
        #   Date.parse(node.content)
        # end
        # game_scores = []
        # doc.css('.gameDay-Container').each_with_index do |container, i|
        #   container.css(".mod-#{league}-scorebox.final-state").each do |game|
        #     game_info = {}
        #     game_info[:game_date]  = game_dates[i]
        #     game_info[:home_team]  = parse_data_name_from game.at_css('.home .team-name')
        #     game_info[:away_team]  = parse_data_name_from game.at_css('.visitor .team-name')
        #     game_info[:home_score] = game.at_css('.home .score .final').content.to_i
        #     game_info[:away_score] = game.at_css('.visitor .score .final').content.to_i
        #     game_scores.push game_info
        #   end
        # end
        debugger
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