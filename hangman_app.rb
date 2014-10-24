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
  erb :hangman, :locals => { 
    :lives => hangman_game.player.lives, 
    :progress => hangman_game.display_progress 
  }
end