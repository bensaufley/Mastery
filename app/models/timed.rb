class Timed < Instance
  validates :started, presence: true

  before_validation :start, if: :new_record?

  def stop
    raise 'Cannot stop an instance on creation.' if self.new_record?
    if self.started?
      if self.done?
        raise 'Cannot end an already-ended instance.'
      else
        self.update_attribute(:done, Time.now)
      end
    else
      raise 'Cannot end an instance that has not started.'
    end
  end

  def start
    raise 'Already started!' if self.activity.running?
    self.started = Time.now
  end

  def time_spent
    Time.diff(done || Time.now,started,'%h:%m:%s')[:diff]
  end


  def self.completed
    where('`done` IS NOT NULL')
  end
  def self.incomplete
    where(done: nil)
  end
  def self.stop
    incomplete.each do |i|
      i.stop
    end
  end

end