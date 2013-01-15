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

  def run(start_word, target_word)
    word_sequence = {}
    #add start_word's adjacent words
    dictionary = valid_dictionary(target_word)
    
    until word_sequence.has_key?(target_word)
      next_level = store_words_in_hash(word_sequence)
      next_level.merge(word_sequence)
    end
    #dict = valid_dictionary(first_word)
    #word_to_change = first_word

  end

  def initial_population(start_word, dictionary)
    
  end

  def store_words_in_hash(storage_hash, dictionary)
      #creates temporary storage hash for the next level of adjacent words
      temporary_word_hash = {}
      #iterate through all existing adj word pairs & find next level
      storage_hash.keys.each do |parent|
        #actually get adjacent words, assign to array, then put into hash
        found_words = adjacent_words(parent, dictionary)
        found_words.each do |adj_word|
          temporary_word_hash[adj_word] = parent
        end
      end
      temporary_word_hash
  end

end