# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TweetSearch' do
  describe '#index' do
    it 'renders the index view' do
      get tweet_searchs_path
      expect(response).to render_template(:index)
    end
  end

  describe '#create' do
    let(:params) do
      { tweet_search: { query: 'a query' } }
    end

    let(:twitter_user) { double('user', name: 'name') }

    let(:twitter_response) do
      [double('tweet', user: twitter_user,
                       text: 'text',
                       favorite_count: 'favorite_count',
                       retweet_count: 'retweet_count')]
    end

    it 'renders the index view' do
      expect(TwitterClient).to receive(:search).and_return(twitter_response)
      post '/tweet_searchs', params: params
      expect(response).to render_template(:index)
    end
  end
end
