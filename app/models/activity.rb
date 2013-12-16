class Activity < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :user
  has_many :instances
  has_many :timeds
  has_many :counteds

  TYPES = [ 'Timed', 'Counted' ]
  validates :name, :type, presence: true
  validates :name, length: { minimum: 3 }
  validates :type, inclusion: { in: TYPES }
  validates_associated :user

  def running?
    !timeds.where(done: nil).empty?
  end

  def stopped?
    !running?
  end

  def stop
    timeds.stop
  end

  def total_count
    counteds.length
  end

  def time_spent(format = '%d, %H and %N')
    sum = 0
    timeds.each do |i|
      sum += (i.done || Time.now) - i.started
    end
    Time.diff(Time.now - sum,Time.now,format)
  end
end
