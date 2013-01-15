class WordChains
  def valid_dictionary(target_word)
    words = []
    File.readlines("2of12inf.txt").each do |line|
      words << line if line.chomp.size == target_word.size
    end
    words
  end


  def adjacent_words

  end

end