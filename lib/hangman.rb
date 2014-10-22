class GameEngine
  attr_accessor :word

  def initialize(display, word)
    @word = word
    @display = display
  end

  def check_guess(guess)
    @display.valid_guess(guess)
  end

end