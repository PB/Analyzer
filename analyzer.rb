file = ARGV[0].nil? ? 'text.txt' : ARGV[0] 
lines = File.readlines(file)
line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

stop_words = %w{the a by on for of are with just but and to the my I has some in}
words = text.scan(/\w+/)
key_words = words.select { |word| !stop_words.include?(word) }
key_words_to_words = ((key_words.length.to_f / words.length.to_f) * 100).to_i

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third+1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }


puts "#{line_count} wierszy"
puts "#{total_characters} znaków"
puts "#{total_characters_nospaces} znaków nie licząc spacji"
puts "#{word_count} słów"
puts "#{paragraph_count} akapitów"
puts "#{sentence_count} zdań"
puts "#{sentence_count / paragraph_count} zdań w jednym akapice (średnio)"
puts "#{word_count / sentence_count} słów w jednym zdaniu (średnio)"
puts "#{key_words_to_words}% słów to słowa znaczące"
puts "Podsumowanie:\n\n #{ideal_sentences.join('. ')}"
puts "--Koniec analizy"