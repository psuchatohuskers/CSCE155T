# hw5.rb - Creting useful functions
#
# Create by Paloch Suchato
#
#Last Modified : 02/17/2018

###############################################################################
# Functions
###############################################################################

#--- Getting the third element to the array ---#
def third(array)
    if array[2].nil? == TRUE
      nilans = "nil"
      return  nilans
    else
      array_2 = array[2]
      return array_2
    end
end


# I got .nil? from Ruby API

#--- Getting The First letter of the sting ---#
def first_char(string_c)
  string_c = string_c.split(" ")
  string_c = string_c[0].split("")
  return string_c[0]
end

#--- Getting first and Last Elements of string ---#
def first_and_last(array1)
  if array1.length < 3
    return "nil"
  else
    first_elm = array1[0]
    last_elm = array1[array1.length-1]
    array2 = Array.new
    array2 = array2.push(first_elm)
    array2 = array2.push(last_elm)

    return array2
  end
end


#--- Concadinate two strings with hyphen ---#

# Similar to Python way
# def hyphenate(string1,string2)
#   hype = string1+"-"+string2
#   return hype
# end

# More ruby way (At least what I think)
def hyphenate(string1,string2)
  string1 << "-"
  string1 << string2
  return string1
end

#--- Calculating Double Exponential ---#

def doublex(int1,int2,int3)
  pow1 = int2**int3
  pow2 = int1**pow1
  return pow2
end
# Refernce for ** https://www.ruby-forum.com/topic/192240

#---- Fiding the area of the circle ----#
def circumference(int1)
  pi = 3.14
  if int1 <= 0
    circum = "nil"
  else
    ray = int1/2
    ray_sq = ray*ray
    circum = pi*ray_sq
  end
  return circum
end

def charcount(string1)
  split1 = string1.split(" ")
  temp_arr = Array.new
  temp_arr2 = Array.new
  # split_fin = Array.new
  split1.each do |item|
    split2 = item.split(".")
    split2.each do |item2|
      temp_arr = temp_arr.push(item2)
    end
  end
  temp_arr.each do |item3|
   temp_split = item3.split("")
   temp_split.each do |item4|
     temp_arr2 = temp_arr2.push(item4)
   end
  end

  return temp_arr2.length
end



##############################################################################
#  Tests
##############################################################################
# third_test = third(["Bieber","Kardashian",101])
# puts third_test
#
# third_test = third([3.14,"pi"])
# puts third_test

# test_me = first_char("Josh loves banana")
# puts test_me
#
# test_me = first_char("I went to Phoennix")
# puts test_me
#
# test_me = first_char(" Si, se puede")
# puts test_me

# array_1 = ["MLK", "Rosa Parks", "The Little Rock Nine", "John Lewis"]
# array_2 = ["César Chávez", "Delano", "El Teatro Campesino"]
# array_3 = ["Fresno", 99]
#
# fl_test = first_and_last(array_1)
# fl_test.each {|item| puts item}
#
# fl_test = first_and_last(array_2)
# for i in 0..(fl_test.length-1)
#   puts fl_test[i]
# end
#
# fl_test = first_and_last(array_3)
# puts fl_test

# string_1 = "Data"
# string_2 = "Science"
# string_3 = ""
#
#
# hype_1 = hyphenate(string_1,string_2)
# puts hype_1
#
# hype_2 = hyphenate(string_3,string_2)
# puts hype_2

# powpow1 = doublex(2,3,4)
# puts powpow1
#
# powpow2 = doublex(0,1,2)
# puts powpow2
#
# powpow3 = doublex(5,15,0)
# puts powpow3

# cir1 = circumference(2)
# puts cir1
#
# cir2 = circumference(0)
# puts cir2
#
# cir3 = circumference(-5)
# puts cir3

test_str1 = "I love computer."
test_str2 = "I must eat doritos."

puts charcount(test_str1)
puts charcount(test_str2)
