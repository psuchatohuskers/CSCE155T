# Second Problem
# Paloch Suchato
my_file = File.new("poem.txt","r")
# Read in new file to working environemnt
poem_arr = my_file.readlines
# puts each line into an elemen of array
poem_arr = poem_arr.reverse
# reverse the oder of the sentense
poem_arr.each do |item|
  puts item.split(" ").reverse.join(" ")
end
