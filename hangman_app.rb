require 'sinatra'
require './lib/hangman'
require 'rack'

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

hangman_game = GameEngine.new(Display.new, "animal")

get '/' do
  current_number_of_lives = hangman_game.player.lives
  erb :hangman, :locals => { :lives => current_number_of_lives }
end