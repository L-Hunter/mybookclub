class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :clubs
  
  validates :fname, presence: true
  validates :lname, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end
