require 'hangman'

describe "user makes a guess" do
  
  let(:display) { double("Display") }
  let(:hangman) { GameEngine.new(display, "animal") }

  it "can accept a valid guess" do
    expect(display).to receive(:valid_guess)
    hangman.check_guess("a")
  end

  it "can accept a full word as a guess" do
    expect(display).to receive(:valid_guess)
    expect(display).to receive(:game_won)
    hangman.check_guess("animal")
  end

  it "can treat lowercase/uppercase guesses as the same" do
    expect(display).to receive(:valid_guess)
    hangman.check_guess("N")
  end

  it "can handle a whole word guess of random casing" do
    expect(display).to receive(:valid_guess)
    expect(display).to receive(:game_won)
    hangman.check_guess("aNiMAl")
  end

  it "can handle whole word guess when single guesses came before" do
    expect(display).to receive(:valid_guess).twice
    expect(display).to receive(:game_won)
    hangman.check_guess("a")
    hangman.check_guess("aNiMAl")
  end

  it "can deduct a life for invalid whole word guess" do
    expect(display).to receive(:invalid_guess)
    hangman.check_guess("qico")
  end

  it "will handle an invalid guess" do
    expect(display).to receive(:invalid_guess)
    hangman.check_guess("b")
  end

  it "can add an invalid guess to trash" do
    expect(display).to receive(:invalid_guess)
    hangman.check_guess("p")
    expect(hangman.get_trashed_letters).to eq("p")
  end

  it "can use trash to keep track of multiple invalid guesses" do
    expect(display).to receive(:invalid_guess).twice
    hangman.check_guess("q")
    hangman.check_guess("w")
    expect(hangman.get_trashed_letters).to eq("q, w")
  end

  it "will not add duplicates to trash" do
    expect(display).to receive(:invalid_guess).twice
    hangman.check_guess("q")
    hangman.check_guess("q")
    expect(hangman.get_trashed_letters).to eq("q")
  end

  it "can keep track of correct guesses" do
    expect(display).to receive(:valid_guess).twice
    hangman.check_guess("a")
    hangman.check_guess("n")
    expect(hangman.correct_guesses).to eq(["a", "n"])
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