require 'hangman'

describe "user makes a guess" do
  
  it "can accept a valid guess" do
    display = double("Display")
    guess = "a"

    expect(display).to receive(:valid_guess).with(guess)
    # create a double for display
    # Check that display.valid_guess recieves a message containing the guess

    hangman = GameEngine.new(display, "animal")
    hangman.check_guess(guess)
  end

end