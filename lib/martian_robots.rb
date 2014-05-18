require_relative 'robot'

def input(arg)
  data = arg.split("\n\n").map {|r| r.split("\n")}
  @map_data = data[0].shift
  @robot_data = data
end

def map_data
  @map_data.split('').map {|e| e.to_i}
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
  @robot_data.each {|e| @robots << Robot.new(e[0],e[1],map_data,robot_scents)}
  @robots
end

def robot_scents
  @robot_scents = []
  @robot_scents
end

def move_robots
  robots.each {|e| e.move}
end
