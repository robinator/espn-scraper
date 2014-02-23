require 'httparty'
require 'nokogiri'

module Scoreboard
  module Fetcher
    def responding?
      HTTParty.get(scores_url).code == 200
    end

    def down?
      !responding?
    end

    # Returns Nokogiri HTML document
    # Ex: ESPN.get('nba')
    def get(*path)
      response = HTTParty.get scores_url + path.join('/')
      if response.code == 200
        Nokogiri::HTML(response.body)
      else
        raise ArgumentError, error_message(url, path)
      end
    end

    private

    def error_message(url, path)
      "The url #{url} from the path #{path} did not return a valid page."
    end
  end
end
