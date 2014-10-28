require 'random-word'

class WordGenerator
  def generate_random_word
    line = []
    IO.foreach('/usr/share/dict/words') { |x|
        if x.length < 8
          line << x
        end
      }
    c = rand*line.length.to_i
    line[c-1]
  end
end