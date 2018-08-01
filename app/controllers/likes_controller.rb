# [omiend] ログイン時にフォロー出来るようにするべきだけど、継承しているApplicationControllerがデフォルトのモノだから、ログインしていなくてもこの機能が呼べてしまう
class LikesController < ApplicationController
# [omiend] インテンドは注意するように
before_action :set_tweet
  def create
    # [omiend] 保存の方法がちょっとよろしくないかも
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