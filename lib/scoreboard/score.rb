class Score
  attr_accessor :home_team, :away_team, :home_score, :away_score, :date
  def initialize(options = {})
    options.each do |k, v|
      send("#{k}=", v)
    end
  end
end