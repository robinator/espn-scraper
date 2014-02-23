$:.push File.expand_path('../lib', __FILE__)
require 'scoreboard/version'

Gem::Specification.new do |s|
  s.name        = 'scoreboard'
  s.version     = Scoreboard::VERSION
  s.date        = '2014-02-21'
  s.summary     = 'A generic sports score scraper'
  s.description = 'A simple sports score scraper with multi-provider support'
  s.authors     = %w[ aj0strow robinator ]
  s.email       = 'alexander.ostrow@gmail.com'
  s.homepage    = 'http://github.com/robinator/scoreboard'

  s.add_dependency 'httparty'
  s.add_dependency 'nokogiri'

  # s.files       = `git ls-files`.split("\n")
  s.files = `ls`.split("\n")
  s.test_files  = `git ls-files -- test`.split("\n")
end