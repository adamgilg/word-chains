class WordChains
  def valid_dictionary(target_word)
    words = []
    File.readlines("2of12inf.txt").each do |line|
      words << line.chomp if line.chomp.size == target_word.size && line.chomp != target_word
    end
    words
  end


  def adjacent_words(target_word, dictionary)
    valid_words = []
    target_word.length.times do |i|
      ("a".."z").each do |letter|
        letter_diff_target = target_word.dup
        letter_diff_target[i] = letter
        if dictionary.include?(letter_diff_target) && !valid_words.include?(letter_diff_target)
          valid_words << letter_diff_target
        end
      end
    end
    valid_words
  end

  def run

  end

end