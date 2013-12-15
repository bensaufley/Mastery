class Timed < Instance
  validates :started, presence: true

  before_validation :start, if: :new_record?

  def done?
    done != nil
  end

  def stop
    raise 'Cannot stop an instance on creation' if self.new_record?
    if started?
      if done?
        raise 'Cannot end an already-ended instance.'
      else
        self.done = Time.now
        self.save
      end
    else
      raise 'Cannot end an instance that has not started.'
    end
  end

  def start
    raise 'Already started!' if self.activity.started?
    self.started = Time.now
  end

  def self.stop
    where(done: nil).each do |i|
      i.stop
    end
  end

end