class Player
  attr_accessor :lives
  def initialize
    @lives = 9
  end

  def deduct_life
    @lives -= 1
  end
end