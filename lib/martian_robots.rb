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

def robots
  @robots = []
  @robot_data.each {|e| @robots << Robot.new(e[0],e[1],map_data,robot_scents)}
  @robots
end

def robot_scents
  @robot_scents
end

def move_robots
  @robot_scents = []
  robots.each do |e| 
    e.move
    if e.lost?
      @robot_scents << e.final_coords
    end
  end
end