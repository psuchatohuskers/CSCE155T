# Shape.rb An introduction to Object Oriented Programming
#
# Paloch Suchato
#
# Last Modified : March 9,2018

class Shape
    def move()
      return "Shape move #{@area}..."
    end
end

class Square < Shape
  def initialize(num)
    @side = num
  end

  def square_area()
    @area =  @side ** 2
    return @area
  end
end

class Circle < Shape
  def initialize(num1)
    @radius = num1
  end

  def circle_area()
    @area = 3.14 * (@radius ** 2)
    return @area
  end
end

class Triangle < Shape
  def initialize(num2,num3)
    @base = num2
    @height = num3
  end

  def tri_area()
    @area = (@base * @height)/2
    return @area
  end
end

the_square = Square.new(2)
puts the_square.square_area()
puts the_square.move()

the_circle = Circle.new(4)
puts the_circle.circle_area()
puts the_circle.move

the_tri = Triangle.new(2,2)
puts the_tri.tri_area()
puts the_tri.move()
