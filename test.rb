a = [1,2,3,4,5,6,7,8,9,10]

left = 0
right = a.length - 1


puts left
puts right

b = 8

while left < right
mid =  ((right - left)/2).round
	if a[mid] == b
		puts "I am in here"
	elsif a[mid] > b
		right = mid - 1
	else
		left = mid + 1
	end
end 


