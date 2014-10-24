class Display
  attr_accessor :last_guess_status, :game_complete

  def valid_guess
    @last_guess_status = "valid"
  end

  def invalid_guess
    @last_guess_status = "invalid"
  end

  def game_won
    @game_complete = true
  end

  def game_lost
    @game_complete = true
  end
end