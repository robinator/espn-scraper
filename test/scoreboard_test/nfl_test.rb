require 'test_helper'

class NflTest < ScoreboardTest

  test 'nfl 2012 week 8 regular season' do
    expected = Scoreboard::Score.new(
      date: Date.parse('Oct 25, 2012'),
      home_team: 'Vikings',
      home_score: 17,
      away_team: 'Buccaneers',
      away_score: 36
      )
    scores = Scoreboard.scores(:nfl, Date.parse('Oct 25, 2012'))
    assert_equal expected, scores.first
  end
  
  test 'nfl 2012 week 7 regular season' do
    expected = Scoreboard::Score.new(
      date: Date.parse('Oct 22, 2012'),
      home_team: 'Bears',
      home_score: 13,
      away_team: 'Lions',
      away_score: 7
      )
    scores = Scoreboard.scores(:nfl, Date.parse('Oct 22, 2012'))
    assert_equal expected, scores.last
  end

  test 'random nfl days' do
    random_days.each do |day|
      scores = Scoreboard.scores(:nfl, day)
      assert all_names_present?(scores), "Error on #{day} for nfl"
    end
  end

end