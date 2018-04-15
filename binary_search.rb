def binary_search(array_in,search_key)
  left = 0
  right = array_in.length-1
  while left < right
    mid = ((right - left)/ 2).round()
    if array_in[mid] == search_key
      return TRUE
    elsif array_in[mid] < search_key
      left = mid + 1
    else
      right  = mid - 1
    end
  end
  return FALSE
end

a = [1,2,3,4,5,6,7,8,9,10]
puts binary_search(a,8)
puts binary_search(a,11)
