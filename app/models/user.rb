class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :activities
  
  validates :username, :first_name, :last_name, presence: true
  validates :username, format: { with: /[A-Z][A-Z0-9\-_]{6,}/i }
  validates :username, uniqueness: true

  def to_param
    username
  end

  def timed_activities
    activities.where(type: 'timed')
  end
  def counted_activities
    activities.where(type: 'counted')
  end
end
