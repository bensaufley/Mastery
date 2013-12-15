class Instance < ActiveRecord::Base
  belongs_to :activity
  validates :type, presence: true, inclusion: { in: Activity::TYPES }
end
