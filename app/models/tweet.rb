## tweetテーブルをuserテーブルの子テーブルとして紐付ける


class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  # ユーザーが既にツイートにいいねしているかどうか確認するメソッド
  def like_user(user_id)
    Like.find_by(user_id: user_id)#
  end
end
