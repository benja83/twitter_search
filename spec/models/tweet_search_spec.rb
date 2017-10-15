# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweetSearch do
  describe '#valid?' do
    context 'When query attribute is not present' do
      it 'returns false' do
        expect(described_class.new.valid?).to be false
      end
    end
    context 'When query attribute is nil' do
      it 'returns false' do
        expect(described_class.new(query: nil).valid?).to be false
      end
    end
    context 'When query attribute is present and has the right lenght' do
      it 'returns true' do
        expect(described_class.new(query: 'a query').valid?).to be true
      end
    end
    context 'When query attribute is present but has more than 500 characters' do
      let(:long_query) { 'a l' + 'o' * 500 + 'ng query' }
      it 'returns false' do
        expect(described_class.new(query: long_query).valid?).to be false
      end
    end
  end

  describe '#search!' do
    context 'when the tweet_search is valid' do
      let(:query) { 'a query' }
      it 'calls the twitter client search method' do
        expect(TwitterClient).to receive(:search).with(query)
        described_class.new(query: query).search!
      end
    end
  end

    describe '#search!' do
    context 'when the tweet_search is not valid' do
      let(:query) { '' }
      it 'does not call the twitter client search method' do
        expect(TwitterClient).to_not receive(:search).with(query)
        described_class.new(query: query).search!
      end
    end
  end
end
