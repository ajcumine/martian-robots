class Robot

  attr_accessor :x_boundary, :y_boundary

  def initialize(init_pos,instr,x_bound,y_bound)
    @initial_position = init_pos.split('')
    @instructions = instr.split('')
    @x_boundary = x_bound
    @y_boundary = y_bound
    safe
  end

  def lost?
    @lost
  end

  def safe
    @lost = false
  end

  def lost
    @lost = true
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
    @new_x = x_coord
    @new_y = y_coord
    @instructions.each do |change|
      movement(change)
      check_lost
    end
  end

  def movement(change)
    if change == 'F'
      forward
    elsif change == 'R'
      right
    elsif change == 'L'
      left
    end
  end

  def check_lost
    if @new_x > x_boundary || @new_x < 0 || @new_y > y_boundary || @new_y < 0
      self.lost
      return
    else
      @final_x = @new_x
      @final_y = @new_y
    end
  end

  def forward
    
    if @final_orientation == 'N'
      @new_y += 1
    elsif @final_orientation == 'E'
      @new_x += 1
    elsif @final_orientation == 'S'
      @new_y -= 1
    elsif @final_orientation == 'W'
      @new_x -= 1
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