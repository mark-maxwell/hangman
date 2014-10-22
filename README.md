hangman
=======

* In pairs we discussed: build a web based hangman game.
  * This is a 1-player game.
  * Players choose to start a new game.
  * Players only guess 1 letter at a time, there is no need to support guessing
    the whole word.
  * Incorrect guesses should be shown in a "trash" area.
  * You don't _need_ to display graphics, simply showing number of lives
    remaining is sufficient.
  * That's not to say you shouldn't try!
  * Use cucumber to drive the development from the outside, but... do most of
    the detailed testing using RSpec.
  * You do not need to worry about storing games beyond the life-time of the
    server
  * Extensions - if you get your game working choose one of these ways to
    extend your project - if you finish one, try the other....
    * Build a 2 player game, each player is asked to enter a word and the winner
      is the player who guesses the other's word in the least number of moves
      * Players cannot enter a non-dictionary word
    * Create a new interface for the game engine that allows you to play hangman
      in slack channel (take a look at their web hook integrations)
      * play should be confined to a single channel
      * any user can ask for a new game
      * any user can guess on the current game
      * you can't start a new game if a game is already in play
