class Counted < Instance
  validates :done, presence: true
  before_validation :tally, if: :new_record?

  private

    def tally
      self.done = Time.now
    end
end