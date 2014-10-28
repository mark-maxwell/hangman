require 'sinatra'
require './lib/hangman'
require 'rack'

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

hangman_game = GameEngine.new(Display.new)

get '/' do

  erb :hangman, :locals => { 
    :lives => hangman_game.player.lives, 
    :progress => hangman_game.display_progress,
    :trash => hangman_game.display_trash
  }

end

get '/submit_guess/' do

  hangman_game.check_guess(params[:guess])

  if hangman_game.display.game_complete
    status, headers, body = call env.merge("PATH_INFO" => '/game_over/' + hangman_game.display.last_guess_status)
  else
    status, headers, body = call env.merge("PATH_INFO" => '/')
  end
  
end

get '/game_over/invalid' do
  'Game Over - INVALID answer ' + hangman_game.answer
end

get '/game_over/valid' do
  'Game Over - VALID'
end