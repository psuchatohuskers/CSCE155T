# word_count.rb : Simply just counting the word
#
# Paloch Suchato
#
# Last modified : Feb 23, 2018
drac = File.new("dracula.txt")

word_count = Hash.new

drac_array = drac.readlines
drac_array.each do |line|
  temp_word = line.split(" ")
  temp_word.each do |word|
      if word_count.has_key?(word)
        word_count[word] = word_count[word].push(word)
      else
        word_count[word] = [word]
      end
  end
end

word_count.each_key do |key|
  word_count[key] = word_count[key].size
end

word_count.each {|item1,item2| puts "#{item2} #{item1}"}
drac.close
