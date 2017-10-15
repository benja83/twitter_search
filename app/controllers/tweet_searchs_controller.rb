# frozen_string_literal: true

class TweetSearchsController < ApplicationController
  def index
    @new_search = TweetSearch.new
  end

  def create
    @new_search = TweetSearch.new
    current_search = TweetSearch.new(query: tweet_search_params[:query])
    if current_search.valid?
      @result_search = current_search.search!
    else
      flash.now[:error] = 'wrong query pass as params'
    end
    render :index
  end

  private

  def tweet_search_params
    params.require(:tweet_search).permit(:query)
  end
end
