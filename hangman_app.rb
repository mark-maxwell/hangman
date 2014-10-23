require 'sinatra'

get '/' do
  erb :hangman
end

template :hangman do
  '<div class="display_container">' + 
    '<span>' + 
      '_ n _ _ _ _' + 
    '</span>' + 
    '<span>' + 
      'Lives: ' + 
    '</span>' + 
  '</div>' + 
  '<form>' +
    '<div class="submit_container">' +
      '<span>' +
        'Enter:' +
      '</span>' +
      '<span>' +
        '<input type="text" name="guess" />' +
      '</span>' +
      '<span>' +
        '<input type="submit" value="submit" />' +
      '</span>' +
    '</div>' +
  '</form>'
end