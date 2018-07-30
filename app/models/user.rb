class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
        #  :confirmable

# 追加
  attr_accessor :login
    # has_many :likes, dependent: :destroy

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end
# 

    # nameが空の時、３文字未満の時、既に他のユーザーが使用している時エラーを表示
    validates :username, presence: true, length: { minimum: 3, message: 'too short!'}, uniqueness: true

    ## passwordが空の時、３文字未満の時エラーを表示
    # validates :password, presence: true, length: { minimum: 3, message: 'too short!'}

end
