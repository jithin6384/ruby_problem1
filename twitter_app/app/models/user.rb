class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tweets
  has_many :follows
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
