class TweetsController < ApplicationController


  def index
    render :json => Tweet.all , status: 200
  end
end
