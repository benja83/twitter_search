# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterClient do
  describe '#search' do
    let(:twitter_spy) { spy(Twitter::REST::Client) }
    it 'creates a Twitter::REST::Client instance and call his search method' do
      expect(Twitter::REST::Client).to receive(:new).and_return(twitter_spy)
      described_class.search('query')
      expect(twitter_spy).to have_received(:search)
    end
  end
end
