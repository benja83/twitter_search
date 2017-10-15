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
end
