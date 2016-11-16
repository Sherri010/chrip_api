class TweetsController < ApplicationController
  before_action :authenticate, except: [:login,:index]
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

 def edit
   tweet = Tweet.find(params[:id])
   if tweet
     render :json => tweet, status:200
   else
     render :json => {error:"not found"},status:404
   end
 end

 def update
   tweet= Tweet.find(params[:id]).update_attributes(tweet_params)

   if tweet
     render :json => tweet , status: 200
   else
     render :json =>{error:"not updated"},status: 200
   end
 end

 def destroy
     t=Tweet.find(params[:id]).destroy
    if t
      render :json => {success:"removed!"}, status: 200
    else
      render :json => {error:"error-not removed"}, status:200
    end
 end

  private

  def tweet_params
     params.require(:tweet).permit(:body)
  end

end
