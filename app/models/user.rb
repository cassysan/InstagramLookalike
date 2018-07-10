class User < ApplicationRecord
  attr_writer :login
  has_many :posts
  has_many :comments
  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def login
    @login || self.username || self.email
  end
end
