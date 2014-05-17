require_relative 'robot'

def input(arg)
  data = arg.split("\n\n").map {|r| r.split("\n")}
  @map_data = data[0].shift
  @robot_data = data
end

def map_data
  @map_data
end

def robot_data
  @robot_data
end

def maximum_x
  @maximum_x = @map_data.split('')[0].to_i
end

def maximum_y
  @maximum_y = @map_data.split('')[1].to_i
end

def robots
  @robots = []
  @robot_data.each {|e| @robots << Robot.new(e[0],e[1]) }
  @robots
end

# def output
#   @output = []
#   f = robots.each {|r| r.move }
#   f.each do |robot|
#     position = "#{robot.final_x}#{robot.final_y}#{robot.final_orientation}"
#     if robot.final_x > maximum_x || robot.final_y > maximum_y
#       position = position + "LOST"
#     end
#     @output << position
#   end
#   @output.join("\n")
# end