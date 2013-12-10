class Activity < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :user

  TYPES = [ 'timed', 'counted' ]
  validates :name, :type, presence: true
  validates :name, length: { minimum: 3 }
  validates :type, inclusion: { in: TYPES }
  validates_associated :user

end
