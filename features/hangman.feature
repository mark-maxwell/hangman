Feature: Basic hangman game

  Scenario: User guesses a correct letter
    Given a valid guess
    When a user makes a guess
    Then user is told guess is correct
      And word is updated to include new guess

  Scenario: User guesses an incorrect letter
    Given an invalid guess
    When a user makes a guess
    Then user is told guess is incorrect
      And a life is deducted

  Scenario: User guesses last letter correctly
    Given a valid guess
    When a user makes a guess
      And there is only one letter left to guess
    Then user is told they have guessed the word
      And the game is over

  Scenario: User runs out of lives
    Given an invalid guess
    When a user makes a guess
      And user only has one life left
    Then the user is told they have ran out of lives
      And the game is over
