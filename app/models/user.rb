class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
        #  :confirmable

  # 追加
  attr_accessor :login
  has_many :tweet
    # has_many :likes, dependent: :destroy

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  # [omiend] has_many等は上段に、メソッドを下段に定義したほうが見通しが良い
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  #
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  #


  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end





  ###
  # # ユーザーをフォローする
  # def follow(other_user)
  #   active_relationships.create(following_id: other_user.id)
  # end

  # # ユーザーをアンフォローする
  # def unfollow(other_user)
  #   active_relationships.find_by(following_id: other_user.id).destroy
  # end

  # # 現在のユーザーがフォローしてたらtrueを返す
  # def following?(other_user)
  #   following.include?(other_user)
  # end



    # nameが空の時、３文字未満の時、既に他のユーザーが使用している時エラーを表示
    validates :username, presence: true, length: { minimum: 3, message: 'too short!'}, uniqueness: true

    ## passwordが空の時、３文字未満の時エラーを表示
    # validates :password, presence: true, length: { minimum: 3, message: 'too short!'}

end
