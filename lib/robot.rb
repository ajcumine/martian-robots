class Robot

  def initialize(init_pos,instr)
    @initial_position = init_pos.split('')
    @instructions = instr.split('')
  end

  def instructions
    @instructions
  end

  def x_coord
    @x_coord = @initial_position[0].to_i
  end

  def y_coord
    @y_coord = @initial_position[1].to_i
  end

  def orientation
    @orientation = @initial_position[2]
  end

  def final_x
    @final_x
  end

  def final_y
    @final_y
  end

  def final_orientation
    @final_orientation
  end

end