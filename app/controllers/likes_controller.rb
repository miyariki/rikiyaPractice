class LikesController < ApplicationController
before_action :set_tweet
  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    # @tweet = Tweet.find(params[:tweet_id])
    @tweets = Tweet.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    # @tweet = Tweet.find(params[:tweet_id])
    @tweets = Tweet.all
  end

  def iine_button
    
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end