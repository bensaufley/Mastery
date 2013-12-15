class TimedInstance < Instance
  validates :started, presence: true

  before_save :start, on: :create

  def stop
    raise 'Cannot stop an instance on creation' if self.new_record?
    if started?
      if done?
        raise 'Cannot end an already-ended instance.'
      else
        self.done = Time.now
      end
    else
      raise 'Cannot end an instance that has not started.'
    end
  end

  private

    def start
      self.started = Time.now
    end

end