class TweetsController < ApplicationController

  def index
    render :json => Tweet.all , status: 200
  end

  def show
     tweet = Tweet.find(params[:id])
     if tweet
       render :json => tweet, status:200
     else
       render :json => {error:'tweet not found'},status: 400
     end
  end


  def create
     tweet = Tweet.create(tweet_params)

    if tweet.valid?
       render :json => tweet ,status:200
    else
       render :json => {error:"something went wrong"}, status:404
     end
  end


  private

  def tweet_params
     params.require(:tweet).permit(:body)
  end

end
