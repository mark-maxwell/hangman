require 'letter'

class GameEngine
  attr_accessor :answer, :shown_word, :character_count

  def initialize(display, word)
    @answer = word
    @display = display
    @shown_word = []
    create_shown_word
  end

  def create_shown_word
    word = @answer.split("")
    word.each {|letter| 
      @shown_word << Letter.new(letter)
    } 
  end

  def check_guess(guess)
    matches = @answer.count(guess).to_i
    if matches > 0
      update_answer(guess)
      @display.valid_guess
    else
      @display.invalid_guess
    end
  end

  def check_progress
    result = ""
    @shown_word.each {|index|
      result += index.letter if index.state
    }
    result
  end
  
  def number_of_characters_left_to_guess
    current_guesses = check_progress
    @answer.length - current_guesses.length
  end

  def update_answer(guess)
    @shown_word.each {|index|
      index.state = true if guess == index.letter
    }
  end

end
