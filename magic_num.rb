# MAGIC NUMBER GAME
# CREATED BY Paloch Suchato
# Feb 2,2017

magicNum = rand(1..10)
magicNum = magicNum.to_i

puts("Welcome to the word of MAGIC NUMBER!")

puts("What is your name?")
name = gets()
name = name.chomp

puts("Hi #{name}!, I am thinking of an integer between 1 to 10 ")
puts("Give me an integer between 1 to 10")

userNum = 0

while (userNum != magicNum)
  userNum = gets()
  userNum = userNum.chomp.to_i
  if (userNum < 1 || userNum > 10)
    puts("#{userNum} is not what I want!")
    puts("Here is a property of integer")
    puts("http://mathworld.wolfram.com/Integer.html")
    puts("Give me a new integer between 1 to 10")
  else
    if (userNum > magicNum)
      puts("You are close #{name}, but your nuber is a bit too hi")
      puts("Don't give up yet!, give me a new integer")
    elsif (userNum < magicNum)
      puts("You are close #{name}, but your nuber is a bit too low")
      puts("Don't give up yet!, give me a new integer")
    else
      puts("You are right #{name}! The magic number is #{magicNum}")
      puts("")
      puts("\t\t\t( ͡ ͜ʖ ͡)")
      break
    end
  end
end
