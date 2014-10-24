require 'sinatra'
require './lib/hangman'
require 'rack'

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

hangman_game = GameEngine.new(Display.new, "animal")

get '/' do
  if params[:guess]
    hangman_game.check_guess(params[:guess])
  end

  game_over = "hidden"

  if hangman_game.display.game_complete
    game_over_input = "disabled"
    game_over = "game-over"
    game_over_message = ""
    if hangman_game.display.last_guess_status == "valid"
      game_over_message = "Well done!"
    else
      game_over_message = "You lose!"
    end
  end

  erb :hangman, :locals => { 
    :lives => hangman_game.player.lives, 
    :progress => hangman_game.display_progress,
    :game_over => game_over,
    :game_over_input => game_over_input,
    :game_over_message => game_over_message
  }

  # if !hangman_game.display.game_complete
  #   erb :hangmaninput
  # else
  #   'You loose'
  # end
end