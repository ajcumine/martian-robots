class Robot

  def initialize(init_pos,instr,x_boundary,y_boundary)
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

  def move
    @final_orientation = orientation
    @final_x = x_coord
    @final_y = y_coord
    @instructions.each do |i|
      if i == 'F'
        forward
      elsif i == 'R'
        right
      elsif i == 'L'
        left
      end
    end
  end

  def forward
    if @final_orientation == 'N'
      @final_y += 1
    elsif @final_orientation == 'E'
      @final_x += 1
    elsif @final_orientation == 'S'
      @final_y -= 1
    elsif @final_orientation == 'W'
      @final_x -= 1
    end
  end

  def right
    if @final_orientation == 'N'
      @final_orientation = 'E'
    elsif @final_orientation == 'E'
      @final_orientation = 'S'
    elsif @final_orientation == 'S'
      @final_orientation = 'W'
    elsif @final_orientation == 'W'
      @final_orientation = 'N'
    end
  end

  def left
    if @final_orientation == 'N'
      @final_orientation = 'W'
    elsif @final_orientation == 'E'
      @final_orientation = 'N'
    elsif @final_orientation == 'S'
      @final_orientation = 'E'
    elsif @final_orientation == 'W'
      @final_orientation = 'S'
    end
  end

end