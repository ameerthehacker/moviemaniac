class User < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_many :casts, :dependent=>:delete_all
  has_many :teams, :dependent=>:delete_all
  has_many :movies, :dependent=>:delete_all
  has_many :comments, :dependent=>:delete_all
  has_and_belongs_to_many :users, :join_table=>:followers, :foreign_key=>:follower_id, :association_foreign_key=>:user_id

  validates :username, :uniqueness=>true, :presence=>true, :length=>{ :maximum=>15, :minimum=>6 }
  validate :username_without_space
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def followers
    self.users
  end
  def username_without_space
    if((username.scan(" ")).count> 0)
      errors.add(:username,"cant contain whitespaces")
      false
    else
      true
    end
  end
end
