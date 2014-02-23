# Scoreboard

Scoreboard is a simple gem for scraping teams and scores from websites. Currently only ESPN is supported, but more sites are to follow.
This code is a fork of (and borrows heavily from) aj0strow's [espn-scraper](https://github.com/aj0strow/espn-scraper)
```ruby
Scoreboard::ESPN.responding?
# => true
```

#### Supported leagues

League support is based on the score source you are using. The ESPN source currently only supports the following leagues:

```ruby
Scoreboard::ESPN.leagues
# => [ :nfl, :nba ]
```

Which are the NFL, NBA. I plan on adding support for the MLB, NHL, NCAA D1 Football, and NCAA D1 Men's Basketball.

#### Scraping scores

All score requests return an array of score objects. Here's an example NFL score:

```ruby
#<Scoreboard::Score:0x007ffa1ca07e40 @date=Sat, 22 Feb 2014, @home_team="Bobcats", @away_team="Grizzlies", @home_score=92, @away_score=89> 
```

Pattern is `Scoreboard::ESPN.scores(:league, date)`.

```ruby
Scoreboard::ESPN.scores(:mlb, Date.parse('Aug 13, 2012'))
Scoreboard::ESPN.scores(:nba, Date.parse('Dec 25, 2011'))
Scoreboard::ESPN.scores(:nfl, Date.parse('Dec 25, 2011'))
```

## Installing

Add the gem to your `Gemfile`

```ruby
gem 'scoreboard', git: 'git://github.com/robinator/scoreboard.git'
# or
gem 'espn_scraper', github: 'robinator/scoreboard'
```

..and then require it.

```ruby
require 'scoreboard'
```

## Contributing

Please report back if something breaks on you!