word = File.new("dracula.txt")

word_array = word.readlines

word_hash = Hash.new

for i in 0..word_array.size-1
  word_store = word_array[i].split(" ")
  for j in 0..word_store.size-1
    if word_hash.has_key?(word_store[j])
      word_hash[word_store[j]] = word_hash[word_store[j]].push(word_store[j])
    else
      word_hash[word_store[j]] = [word_store[j]]
    end
  end
end

puts word_hash
