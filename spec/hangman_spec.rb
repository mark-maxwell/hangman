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

  it "can add an invalid guess to trash" do
    expect(display).to receive(:invalid_guess)
    hangman.check_guess("p")
    expect(hangman.get_trashed_letters).to eq(["p"])
  end

  it "can use trash to keep track of multiple invalid guesses" do
    expect(display).to receive(:invalid_guess).twice
    hangman.check_guess("q")
    hangman.check_guess("w")
    expect(hangman.get_trashed_letters).to eq(["q", "w"])
  end

describe "lives can be checked and deducted" do
  it "can remove a life" do
    expect(display).to receive(:invalid_guess)
    current_lives = hangman.player.lives
    hangman.check_guess("r")
    expect(current_lives - 1).to eq(hangman.player.lives )
  end
end
end