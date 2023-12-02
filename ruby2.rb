def def_most_frequent_item(array)
    frequency_hash = Hash.new(0)
    array.each { |element| frequency_hash[element] += 1 }
  
    max_frequency = frequency_hash.values.max
  
    most_frequent_elements = frequency_hash.select { |_, frequency| frequency == max_frequency }.keys
  
    puts "Найчастіший(і) елемент(и): #{most_frequent_elements.join(', ')}"
  end
  
  array1 = [1, 3, 1, 3, 2, 1]
  def_most_frequent_item(array1)
  
  array2 = [4, 4, 5, 6, 6, 5, 8, 8]
  def_most_frequent_item(array2)



  def def_piggyback_latin(sentence)
    words = sentence.split(' ')
  
    pig_latin_words = words.map do |word|
      punctuation = word.match(/[\W_]*$/)[0]
      base_word = word.chomp(punctuation)
  
      pig_latin_word = "#{base_word[1..-1]}#{base_word[0]}ay#{punctuation}"
    end
  
    puts pig_latin_words.join(' ')
  end
  
  sentence1 = "Hello world"
  def_piggyback_latin(sentence1)
  
  sentence2 = "I love Ruby programming!"
  def_piggyback_latin(sentence2)