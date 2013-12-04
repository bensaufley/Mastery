class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  
  validates :username, :first_name, :last_name, presence: true
  validates :username, format: { with: /[A-Z][A-Z0-9\-_]{6,}/i }
  
end
