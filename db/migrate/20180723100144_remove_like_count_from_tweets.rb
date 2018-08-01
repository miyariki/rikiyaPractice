class RemoveLikeCountFromTweets < ActiveRecord::Migration[5.2]
  def change
    # [omiend] 無いカラムを消そうとしているのでコメントアウト
    # remove_column :tweets, :like_count, :integer
  end
end
