class Valid
  def guess(guess, trash)
    if guess !~ /[a-zA-Z'!,?\.]/
      return [false, "Howdy partner, that's an odd looking guess you ahve thar!"]
    elsif trash.include?(guess)
      return [false, "Too slow on the draw partner."]
    else
      return [true, ""]
    end
  end
end