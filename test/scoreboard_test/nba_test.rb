require 'test_helper'

class NbaTest < EspnTest

  test 'nba december 25th celtics beat nets' do
    day = Date.parse('Dec 25, 2012')
    expected = Scoreboard::Score.new(
      date: day,
      home_team: 'Nets',
      home_score: 76,
      away_team: 'Celtics',
      away_score: 93
    )
    scores = Scoreboard.scores(:nba, day)
    assert_equal expected, scores.first
  end

  test 'random nba days' do
    random_days.each do |day|
      scores = Scoreboard.scores(:nba, day)
      assert all_names_present?(scores), "Error on #{day} for nba"
    end
  end
  
end