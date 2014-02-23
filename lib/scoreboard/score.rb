module Scoreboard
  class Score
    attr_accessor :home_team, :away_team, :home_score, :away_score, :date

    def initialize(options = {})
      options.each do |k, v|
        send("#{k}=", v)
      end
    end

    def ==(score)
      instance_variables.all? do |v|
        instance_variable_get(v) == score.instance_variable_get(v)
      end
    end
  end
end