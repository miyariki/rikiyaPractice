class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      # [omiend] 命名規則って結構難しいのだけど、例えば「user_follower_id」「user_following_id」などの用に、どのテーブルとのリレーションかわかるようにする必要がある
      # [omiend] あとは、誰のデータなのかをわかるように、 「user_id」、「user_follower_id」、「user_following_id」と用意して上げた方が良いかも
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end

    add_index :relationships, :follower_id
    add_index :relationships, :following_id
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
