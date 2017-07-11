class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :movies
  has_many :reviews, dependent: :destroy
  has_one :vote
  has_one :upvotes, through: :votes
  has_one :downvotes, through: :votes

  def get_fullname
    first_name + ' ' + last_name
  end
end
