require 'letter'
require 'player'

class GameEngine
  attr_accessor :answer, :shown_word, :character_count, :player

  def initialize(display, word)
    @player = Player.new
    @answer = word
    @display = display
    @shown_word = []
    create_shown_word
    @trash = []
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
      process_valid_guess(guess)
    else
      process_invalid_guess(guess)
    end
  end

  def process_valid_guess(guess)
    update_answer(guess)
    @display.valid_guess
    word_complete if number_of_characters_left_to_guess == 0
  end

  def process_invalid_guess(guess)
    @display.invalid_guess
    add_to_trash(guess)
      if is_game_over?
        @display.game_lost
      end
      @player.deduct_life
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

  def add_to_trash(guess)
    @trash << guess unless @trash.include?(guess)
  end

  def get_trashed_letters
    @trash
  end

  def update_answer(guess)
    @shown_word.each {|index|
      index.state = true if guess == index.letter
    }
  end

  def word_complete
    @display.game_won
  end

  def is_game_over?
    if @player.lives == 1
      true
    else
      false
    end
  end

end
