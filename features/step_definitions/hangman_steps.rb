Given(/^a word to guess$/) do
  hangman = GameEngine.new(display, "animal")
end

When(/^a user makes a valid guess$/) do
  hangman.check_guess("a")
end

Then(/^user is told guess is correct$/) do
  pending
end

Then(/^word is updated to include new guess$/) do
  pending
end

When(/^a user makes an invalid guess$/) do
  check_guess("q")
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