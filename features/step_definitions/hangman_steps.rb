require './lib/hangman'

Given(/^a word to guess$/) do
  self.hangman
end

When(/^a user makes a valid guess$/) do
  self.hangman_game.check_guess("a")
end

Then(/^user is told guess is correct$/) do
  expect( display.last_guess_status ).to eq("valid")
end

Then(/^word is updated to include new guess$/) do
  pending
end

When(/^a user makes an invalid guess$/) do
  hangman.check_guess("q")
end

Then(/^user is told guess is incorrect$/) do
  pending
end

Then(/^a life is deducted$/) do
  pending
end

When(/^there is only one letter left to guess$/) do
  pending
end

Then(/^user is told they have guessed the word$/) do
  pending
end

Then(/^the game is over$/) do
  pending
end

When(/^user only has one life left$/) do
  pending
end

Then(/^the user is told they have ran out of lives$/) do
  pending
end

module TestDisplay
  def display
    @display ||= Display.new
  end

  class Display
    attr_accessor :last_guess_status

    def valid_guess
      @last_guess_status = "valid"
    end

    def invalid_guess
      @last_guess_status = "invalid"
    end
  end
end

World(TestDisplay)

module Helpers
  attr_accessor :hangman_game

  def hangman
    self.hangman_game ||= GameEngine.new(display, "animal")
  end
end

World(Helpers)