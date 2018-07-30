class RemoveLikeCountFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :like_count, :integer
  end
end
