# frozen_string_literal: true

# non persisted model for Tweet search
class TweetSearch
  include ActiveModel::Model

  attr_accessor :query

  validates :query, presence: true, length: { in: 1..500 }
end
