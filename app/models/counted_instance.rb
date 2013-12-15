class CountedInstance < Instance
  validates :tallied, presence: true
  before_save :tally, on: :create

  private

    def tally
      self.done = Time.now
    end
end