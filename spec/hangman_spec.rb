require 'hangman'

describe "user makes a guess" do
  
  let(:display) { double("Display") }
  let(:hangman) { GameEngine.new(display, "animal") }

  it "can accept a valid guess" do
    guess = "a"

    expect(display).to receive(:valid_guess)
    hangman.check_guess(guess)
  end

  it "will handle an invalid guess" do
    guess = "b"

    expect(display).to receive(:invalid_guess)
    hangman.check_guess(guess)
  end

describe "lives can be checked and deducted" do
  it "can remove a life" do
    current_lives = hangman.check_lives
    hangman.check_guess("r")
    expect(current_lives - 1 ).to eq(hangman.check_lives)
  end
end

end