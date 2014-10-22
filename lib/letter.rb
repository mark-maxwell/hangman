class Letter
  attr_accessor :letter, :state

  def initialize(letter)
    @letter = letter
    @state = false
  end
end