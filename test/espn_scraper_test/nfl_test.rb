require 'test_helper'

class NflTest < Test::Unit::TestCase

  test 'nfl 2012 week 8 regular season' do
    expected = {
      league: 'nfl',
      game_date: Date.parse('Oct 25, 2012'),
      home_team: 'min',
      home_score: 17,
      away_team: 'tam',
      away_score: 36
    }
    scores = ESPN.get_nfl_scores(2012, 8)
    assert_equal expected, scores.first
  end
  
  test 'nfl 2012 week 7 regular season' do
    expected = {
      league: 'nfl',
      game_date: Date.parse('Oct 22, 2012'),
      home_team: 'chi',
      home_score: 13,
      away_team: 'det',
      away_score: 7
    }
    scores = ESPN.get_nfl_scores(2012, 7)
    assert_equal expected, scores.last
  end
  
  test 'looking for a break' do
    puts "Checking for errors (will take a while)"
    (1..17).each do |week|
      scores = ESPN.get_nfl_scores(2012, week)
      assert all_names_present?(scores), "!!! error in week #{week}"
    end
  end

end