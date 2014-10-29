require_relative 'letter'
require_relative 'player'
require_relative 'display'
require_relative 'validate'

class GameEngine
  attr_accessor :answer, :shown_word, :character_count, :player, :display, :trash, :error_message

  def initialize(display, word)

    @answer = word
    @player = Player.new
    @display = display
    @shown_word = []
    create_shown_word
    @trash = []
    @valid = Valid.new
    @error_message = "Howdy Partner, why not give us ya first guess!"
  end

  def validate_guess(guess)
    puts "here"
    is_guess_valid = @valid.guess(guess, @trash)
    if is_guess_valid[0]
      check_guess(guess)
      @error_message = ""
    else
      @error_message = is_guess_valid[1]
    end
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

  def display_progress
    result = ""
    @shown_word.each {|index|
      if index.state
        result += " " + index.letter
      else
        result += " _"
      end
    }
    result
  end

  def display_trash
    @trash.join(", ")
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

    if guess.length > 1
      whole_word_guess(guess)
    else
      @shown_word.each {|index|
        index.state = true if guess == index.letter
      }
    end
  end

  def whole_word_guess(guess)
    if guess == @answer
      @shown_word.each {|index|
        index.state = true
      }
    else
      process_invalid_guess(guess)
    end
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
