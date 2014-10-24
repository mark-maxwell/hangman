Feature: Basic hangman game

  Scenario: User guesses a correct letter
    Given a word to guess
    When a user makes a valid guess
    Then user is told guess is correct
      And word is updated to include new guess

  Scenario: User guesses an incorrect letter
    Given a word to guess
    When a user makes an invalid guess
    Then user is told guess is incorrect
      And a life is deducted
      And incorrect letter is added to trash

  Scenario: User guesses last letter correctly
    Given a word to guess
    When a user makes a valid guess
      And there is only one letter left to guess
    Then user is told they have guessed the word

  Scenario: User runs out of lives
    Given a word to guess
    When a user makes 8 invalid guesses
      And user only has one life left
      And then makes a further invalid guess
    Then the user is told they have ran out of lives
