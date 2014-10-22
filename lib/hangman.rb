class GameEngine
  attr_accessor :word

  def initialize(display, word)
    @word = word
    @display = display
  end

  def check_guess(guess)
    matches = (@word.count guess).to_i
    
    if matches > 0
      @display.valid_guess(guess)
    else
      @display.invalid_guess(guess)
    end
  end

end