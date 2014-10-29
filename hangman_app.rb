require 'sinatra'
require './lib/hangman'
require './lib/word_generator'
require 'rack'

configure :development do
  Sinatra::Application.reset!
  use Rack::Reloader
end

enable :sessions
get '/' do
    
    if session[:new_word] == nil
      status, headers, body = call env.merge("PATH_INFO" => '/reset/')
    end
    
    erb :hangman, :locals => {
      :lives => session[:hangman_game].player.lives, 
      :progress => session[:hangman_game].display_progress,
      #:trash => session[:hangman_game].display_trash,
      :trashed_letters => session[:hangman_game].get_trashed_letters,
      :trashed_words => session[:hangman_game].get_trashed_words,
      :error_message => session[:hangman_game].error_message
    }

end

get '/submit_guess/' do

  session[:hangman_game].validate_guess(params[:guess])

  if session[:hangman_game].display.game_complete
    status, headers, body = call env.merge("PATH_INFO" => '/game_over/' + session[:hangman_game].display.last_guess_status)
  else
    status, headers, body = call env.merge("PATH_INFO" => '/')
  end

end

get '/game_over/invalid' do
    erb :invalid, :locals => {
      :answer => session[:new_word]
    }
end

get '/game_over/valid' do
  erb :valid, :locals => {
      :answer => session[:new_word]
    }
end

get '/reset/' do
  session[:new_word] = WordGenerator.new.generate_random_word
  session[:hangman_game] = GameEngine.new(Display.new, session[:new_word])
  status, headers, body = call env.merge("PATH_INFO" => '/')
end

get '/set_custom_word' do
  erb :custom_word
end

get '/custom_word/' do
  session[:new_word] = params[:custom_word]
  session[:hangman_game] = GameEngine.new(Display.new, session[:new_word])
  status, headers, body = call env.merge("PATH_INFO" => '/')
end