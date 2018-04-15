def binary_search(array_in,search_key)
	sort_array = array_in.sort
	left = 0 
	right = sort_array.length - 1
	
	while left <= right
		mid = left + ((right - left)/2).round
		if sort_array[mid] == search_key
			return true
		elsif sort_array[mid] > search_key
			right = mid - 1
		else
			left = mid + 1
		end
	end

	return false
end


dic = File.new("dictionary.txt", "r")
dic_array = dic.readlines().map(&:strip)
puts "Welcome to binary search of dictionary"


puts "What do you want to search for?"
search_name = gets()
search_name = search_name.chomp()

puts "Searching ..."
search_binary = binary_search(dic_array,search_name)
puts search_binary

if search_binary == true
	puts "#{search_name} is in this dictionary"
else
	puts "#{search_name} is not an element of dictionary"
end

#references
#	For map(&:strip)
#	1)https://stackoverflow.com/questions/4463540/ruby-each-line-read
#	s-line-break-too/4463671
