class User < ActiveRecord::Base
  has_and_belongs_to_many :skills

  validates :username, :uniqueness=>true, :presence=>true, :length=>{ :maximum=>15, :minimum=>6 }
  validate :username_without_space
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def username_without_space
    if((username.scan(" ")).count>0)
      errors.add(:username,"cant contain whitespaces")
      false
    else
      true
    end
  end
end
