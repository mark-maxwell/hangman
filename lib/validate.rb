class Valid
  def guess(guess, trash, correct_guesses)
    if guess =~ /[!*,.'\d]/ || guess.length > 7
      return [false, "Howdy partner, that's an odd looking guess you ahve thar!"]
    elsif trash.include?(guess.downcase)
      return [false, "Too slow on the draw partner."]
    elsif correct_guesses.include?(guess.downcase)
      return false, "C'mon now!!! You just tried that... LOOK UP!!!"
    else
      return [true, ""]
    end
  end
end