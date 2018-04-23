class Light

  def on_off()
    if @switch == 1
      return "on"
    else
      return "off"
    end
  end

end


class Fix < Light

  def initialize(input,red,blue,green)
    @switch = input
    @red_light = red
    @blue_light = blue
    @green_light = green
  end

  def fix_color()
    if @switch == 1
      if @red_light == 1 && @blue_light == 0 && @green_light == 0
        return "red"
      elsif @red_light == 0 && @blue_light == 1 && @green_light == 0
        return "blue"
      elsif @red_light == 0 && @blue_light == 0 && @green_light == 1
        return "green"
      elsif @red_light == 1 && @blue_light == 1 && @green_light == 0
        return "magenta"
      elsif @red_light == 1 && @blue_light == 0 && @green_light == 1
        return "yellow"
      elsif @red_light == 0 && @blue_light == 1 && @green_light == 1
        return "cyan"
      else
        return "white"
      end
    else
      return "This light is off"
    end
  end

end

class Spot < Light

  def initialize(input,move)
    @switch = input
    @direction = move
  end

  def light_position()
    if @direction == "u"
      return "up"
    elsif @direction == "d"
      return "down"
    elsif @direction == "r"
      return "right"
    elsif @direction == "l"
      return "left"
    else
      return "centre"
    end
  end

end

class Strobe

  def initialize(input)
    @switch = input
  end

  def want_to_turn_on(light_hash)
    light_stat_array = Array.new()
    light_hash.each_value do |value|
      light_stat_array.push(value[0])
    end
    if light_stat_array.include?("on")
      return "off"
    else
      if @switch != 1
        return "off"
      else
        return "on"
      end
    end
  end

end

class Rack

  def initialize(fix_strobe)
    @light_rack = Array.new
    while fix_strobe.empty? == false
        @light_rack.push(fix_strobe.pop(4))
    end
  end

  def return_rack()
    return @light_rack
  end

end


puts "Welcome to theater light management"
puts "How many fix light do you want?"
fix_num = gets()
fix_num = fix_num.chomp().to_i
fix_lights = Hash.new
for i in 1..fix_num
  puts "Fix light #{i}"
  puts "Do you want to turn this light on? (On = 1/ Off = 0)"
  light_on = gets()
  light_on = light_on.chomp().to_i()
  if light_on == 1
    puts "Color mixing"
    puts "Do you want to put red gel? (Yes = 1/ No = 0)"
    red_gel = gets()
    red_gel = red_gel.chomp().to_i()
    puts "Do you want to put blue gel? (Yes = 1/ No = 0)"
    blue_gel = gets()
    blue_gel = blue_gel.chomp().to_i()
    puts "Do you want to put green gel? (Yes = 1/ No = 0)"
    green_gel = gets()
    green_gel = green_gel.chomp().to_i()
    fix_temp = Fix.new(light_on,red_gel,blue_gel,green_gel)
  else
    fix_temp = Fix.new(light_on,0,0,0)
  end
  fix_lights["fix" + "-" + i.to_s] = [fix_temp.on_off,fix_temp.fix_color]
end

puts "How many spot light do you want?"
spot_num = gets()
spot_num = spot_num.chomp().to_i
spot_lights = Hash.new
for j in 1..spot_num
  puts "Spot light #{j}"
  puts "Do you want to turn this light on? (On = 1/ Off = 0)"
  light_on = gets()
  light_on = light_on.chomp().to_i()
  puts "What is the position of this light? (Up = u, Down = d,
  Right = r, Left = l, centre = c)"
  pos_spot = gets()
  pos_spot = pos_spot.chomp()
  spot_temp = Spot.new(light_on,pos_spot)
  spot_lights["spot"+ "-" + j.to_s] = [spot_temp.on_off,spot_temp.light_position]
end

fix_and_spot = fix_lights.merge(spot_lights)

puts "How many strobe light do you want?"
strobe_num = gets()
strobe_num = strobe_num.chomp().to_i
strobe_lights = Hash.new
for k in 1..strobe_num
  puts "Strobe light #{k}"
  puts "Do you want to turn this light on? (On = 1/ Off = 0)"
  light_on = gets()
  light_on = light_on.chomp().to_i()
  strobe_temp = Strobe.new(light_on)
  strobe_lights["strobe"+ "-" + k.to_s] = strobe_temp.want_to_turn_on(fix_and_spot)
end

fix_and_strobe = fix_lights.merge(strobe_lights)

puts "Here is your light arrangement"
fix_lights.each do |fix_num,fix_col|
  puts "#{fix_num} status:#{fix_col[0]} colour:#{fix_col[1]}"
end
spot_lights.each do |spot_num,spot_pos|
  puts "#{spot_num} status:#{spot_pos[0]} position:#{spot_pos[1]}"
end
strobe_lights.each do |strobe_num, stat|
  puts "#{strobe_num} status:#{stat}"
end

fix_strobe_light = Array.new
fix_and_strobe.each_key do |key|
  fix_strobe_light.push(key)
end

racks = Rack.new(fix_strobe_light)
racks = racks.return_rack()
for each_rack in 1..racks.length
  puts "rack #{each_rack} contains:"
  racks[each_rack - 1].each do |light|
    puts light
  end
end
