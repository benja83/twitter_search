# frozen_string_literal: true

# twitter client to connect with twitter API
class TwitterClient
  MAX_TWEETS_PER_REQUEST = 10
  class << self
    def search(query)
      client.search(query).take(MAX_TWEETS_PER_REQUEST)
    end

    private

    attr_reader :client

    def client
      @client ||= Twitter::REST::Client.new do |config|
                    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
                    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
                    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
                    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
                  end
    end
  end
end


